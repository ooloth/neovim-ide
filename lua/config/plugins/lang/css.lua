--  TODO: linting?
--  TODO: https://www.lazyvim.org/extras/lang/tailwind

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
      ensure_installed = { 'css', 'scss', 'styled' },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        cssls = {},
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        css = { 'prettier' },
        less = { 'prettier' },
        scss = { 'prettier' },
      },
    },
  },
}
