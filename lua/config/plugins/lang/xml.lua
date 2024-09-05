return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'xml' },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        lemminx = {},
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        -- Also need to install @prettier/plugin-xml in project:
        -- https://github.com/prettier/plugin-xml
        xml = { 'prettier' },
      },
    },
  },

  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        -- see: https://www.html-tidy.org (installed via homebrew)
        xml = { 'tidy' },
      },
    },
  },
}
