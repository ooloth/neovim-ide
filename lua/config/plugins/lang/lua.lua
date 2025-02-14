-- TODO: linting
-- TODO: debugging: https://www.lazyvim.org/extras/dap/nlua

return {
  -- {
  --   'williamboman/mason-tool-installer.nvim',
  --   opts = {
  --     ensure_installed = {},
  --   },
  -- },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'lua', 'luadoc', 'luap' },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              -- see: https://luals.github.io/wiki/settings/
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = 'Replace',
              },
              doc = {
                privateName = { '^_' },
              },
              hint = {
                arrayIndex = 'Disable',
                enable = true,
                paramType = true, -- requires the parameters to be defined with @param
                -- paramName = 'Disable', -- 'All', 'Literal', 'Disable'
                semicolon = 'Disable',
                setType = true, -- display the type being applied at assignment operations
              },
              workspace = {
                checkThirdParty = false,
              },
            },
          },
        },
      },
    },
  },

  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    -- see: https://github.com/folke/lazydev.nvim
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        'lazy.nvim',
        -- Load the wezterm types when the `wezterm` module is required
        -- Needs `justinsgithub/wezterm-types` to be installed
        -- { path = 'wezterm-types', mods = { 'wezterm' } },
        -- Load luvit types when the `vim.uv` word is found
        -- { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- { 'Bilal2453/luvit-meta', lazy = true }, -- optional `vim.uv` typings

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = { lua = { 'stylua' } },
    },
  },

  -- {
  --   -- see: https://github.com/mfussenegger/nvim-lint
  --   'mfussenegger/nvim-lint',
  --   opts = {
  --     -- see: https://www.lazyvim.org/plugins/linting#nvim-lint
  --     -- see: https://github.com/mfussenegger/nvim-lint#available-linters
  --     linters_by_ft = {
  --       lua = { 'luacheck' },
  --     },
  --   },
  -- },
}
