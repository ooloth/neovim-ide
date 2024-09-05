--  TODO: lsp
--  TODO: linting
--  TODO: dap?

local extend = require('config.util').extend

return {
  {
    'williamboman/mason-tool-installer.nvim',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'prettier' })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'graphql' })
    end,
  },

  -- {
  --   'neovim/nvim-lspconfig',
  --   opts = {
  --     servers = {
  --     },
  --   },
  -- },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        graphql = { 'prettier' },
      },
    },
  },
}
