-- TODO: https://www.lazyvim.org/extras/util/dot
-- TODO: dap?
-- https://www.reddit.com/r/neovim/comments/xzr6py/nvimdap_bash_debugging/
-- TODO: testing?

local extend = require('config.util').extend

-- Tell treesitter to parse zsh like bash (until someone writes a zsh parser):
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/655#issuecomment-1476880919
vim.treesitter.language.register('bash', 'zsh')

return {
  {
    'williamboman/mason-tool-installer.nvim',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'shellcheck' })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'bash' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      -- NOTE: linting comes from eslint-lsp (which already includes vue files by default)
      servers = {
        -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
        bashls = {},
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        bash = { 'shfmt' },
        sh = { 'shfmt' },
      },
    },
  },

  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        bash = { 'shellcheck' },
        sh = { 'shellcheck' },
      },
    },
  },
}
