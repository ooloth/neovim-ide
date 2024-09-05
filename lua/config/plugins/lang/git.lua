-- TODO: https://www.lazyvim.org/extras/lang/git
--  TODO: lsp?
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
      ensure_installed = { 'diff', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore' },
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
