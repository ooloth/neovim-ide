--  TODO: lsp?
--  TODO: formatting?
--  TODO: linting?

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
      ensure_installed = { 'pug' },
    },
  },

  -- {
  --   'neovim/nvim-lspconfig',
  --   opts = {
  --     servers = {
  --     },
  --   },
  -- },

  -- {
  --   'stevearc/conform.nvim',
  --   opts = {
  --     formatters_by_ft = {},
  --   },
  -- },
}
