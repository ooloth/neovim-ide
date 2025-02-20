--  TODO: lsp?
--  TODO: linting: https://htmlhint.com/docs/user-guide/getting-started

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'html' },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        html = { 'prettier' },
      },
    },
  },

  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        -- see: https://www.html-tidy.org (installed via homebrew)
        html = { 'tidy' },
      },
    },
  },
}
