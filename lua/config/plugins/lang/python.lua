-- TODO: Exploring Data Science Tools and Workflows in NVIM: https://www.youtube.com/watch?v=1xoUmncDwHQ
-- TODO: testing: unittest?
-- TODO: https://www.lazyvim.org/extras/lang/python
-- TODO: https://www.lazyvim.org/extras/formatting/black

local is_installed_in_venv = require('config.util.prefer_venv').is_installed_in_venv
local prefer_venv_executable = require('config.util.prefer_venv').prefer_venv_executable

-- Help debugger find current project's local (not pip) modules:
-- https://stackoverflow.com/a/63271966/8802485
vim.env.PYTHONPATH = vim.fn.getcwd()

-- TODO: automate creation of the pynvim venv and the installation of pynvim, debugpy + CopilotChat's pip deps during mac setup
-- get python executable where pynvim is installed for running remote plugins written in python (see :h provider-python)
-- see: https://github.com/neovim/pynvim/issues/498
-- see: https://github.com/neovim/pynvim/issues/16#issuecomment-152417012
local pynvim_python = vim.env.HOME .. '/.pyenv/versions/pynvim/bin/python'
vim.g.python3_host_prog = pynvim_python

-- get the python executable from the project venv (if active) for dap and neotest
local python = prefer_venv_executable('python')

-- see: https://docs.astral.sh/ruff/editors/setup/#neovim
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then return end
    if client.name == 'ruff' then
      client.server_capabilities.hoverProvider = false -- Disable hover in favor of Pyright
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})

-- see: https://github.com/stevearc/conform.nvim/blob/master/lua/conform/formatters/black.lua
local get_formatter_options = function(formatter)
  local formatter_options = require('conform.formatters.' .. formatter)
  local executable = formatter == 'ruff_format' and 'ruff' or formatter
  formatter_options.command = prefer_venv_executable(executable)
  formatter_options.condition = function() return is_installed_in_venv(executable) end
  return formatter_options
end

local get_linters_in_venv = function(linters)
  local linters_in_venv = vim.tbl_filter(function(linter)
    local executable = linter == 'ruff_lint' and 'ruff' or linter
    return is_installed_in_venv(executable)
  end, linters)

  return linters_in_venv
end

local get_linter_options = function(linter)
  local linter_options = require('lint.linters.' .. linter)
  linter_options.cmd = prefer_venv_executable(linter)
  return linter_options
end

return {
  {
    'williamboman/mason-tool-installer.nvim',
    opts = {
      ensure_installed = { 'flake8', 'mypy', 'ruff' },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'python', 'requirements' },
    },
  },

  {
    'neovim/nvim-lspconfig',
    -- see: https://www.lazyvim.org/extras/lang/python#nvim-lspconfig
    opts = {
      servers = {
        -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
        -- pylsp = {
        --   settings = {
        --     pylsp = {
        --       plugins = {
        --         autopep8 = { enabled = false },
        --       },
        --     },
        --   },
        -- },
        -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
        pyright = {
          capabilities = (function()
            -- Disable Pyright diagnostics (use flake8 or ruff for linting):
            -- see: https://www.reddit.com/r/neovim/comments/11k5but/how_to_disable_pyright_diagnostics/
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
            return capabilities
          end)(),
          settings = {
            -- see: https://microsoft.github.io/pyright/#/settings
            python = {
              analysis = {
                ignore = { '*' }, -- ignore all files for analysis to exclusively use Ruff for linting
              },
              disableOrganizeImports = true, -- use ruff for import sorting
              pythonPath = python, -- point pyright to venv
            },
          },
        },
        -- Ruff Server (replaces ruff_lsp and handles linting, formatting and code actions)
        -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff
        -- see: https://docs.astral.sh/ruff/editors/setup/#neovim
        -- see: Ruff's language server is now written in Rust: https://astral.sh/blog/ruff-v0.4.5
        ruff = {},
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      -- NOTE: ruff_format has been replaced by the ruff lsp above
      formatters_by_ft = { python = { 'isort', 'black', 'yapf' } },
      formatters = {
        black = function() return get_formatter_options('black') end,
        isort = function() return get_formatter_options('isort') end,
        yapf = function() return get_formatter_options('yapf') end,
      },
    },
  },

  {
    'mfussenegger/nvim-lint',
    -- see: https://www.lazyvim.org/plugins/linting#nvim-lint
    opts = {
      linters_by_ft = {
        -- NOTE: ruff_lint has been replaced by the ruff lsp above
        python = get_linters_in_venv({ 'flake8', 'mypy' }),
      },
      linters = {
        flake8 = function() return get_linter_options('flake8') end,
        mypy = function() return get_linter_options('mypy') end,
      },
    },
  },

  -- TODO: dap
  -- {
  --   'mfussenegger/nvim-dap',
  --   dependencies = {
  --     'mfussenegger/nvim-dap-python',
  --     keys = {
  --       { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
  --       { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
  --     },
  --     config = function()
  --       -- use the debugpy installed in the pynvim venv so I don't have to install it in every project's venv:
  --       local pynvim_debugpy_python = vim.env.HOME .. '/.pyenv/versions/pynvim/bin/debugpy' .. '/venv/bin/python'
  --
  --       require('dap-python').setup(pynvim_debugpy_python, { include_configs = true, pythonPath = python })
  --     end,
  --   },
  -- },

  -- TODO: testing
  -- {
  --   'nvim-neotest/neotest',
  --   dependencies = {
  --     'nvim-neotest/neotest-python',
  --   },
  --   opts = {
  --     adapters = {
  --       ['neotest-python'] = {
  --         -- see: https://github.com/nvim-neotest/neotest-python
  --         args = { '--log-level', 'DEBUG', '--quiet' },
  --         dap = {
  --           -- see: https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings#launchattach-settings
  --           console = 'integratedTerminal',
  --           justMyCode = true,
  --         },
  --         python = python,
  --       },
  --     },
  --   },
  -- },
}
