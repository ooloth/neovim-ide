--  TODO: lsp
--  TODO: linting
--  TODO: dap?

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
      ensure_installed = { 'graphql' },
    },
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
