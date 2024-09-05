-- TODO: https://www.lazyvim.org/extras/lang/go
-- TODO: Configure Golang in Kickstart.nvim: https://www.youtube.com/watch?v=CNYqPnaCgJw
-- TODO: lsp
-- TODO: linting
-- TODO: dap

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
      ensure_installed = { 'go' },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        go = { 'gofumpt', 'goimports', 'gci' },
      },
    },
  },
}
