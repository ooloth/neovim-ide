--  TODO: lsp: https://github.com/Freed-Wu/tmux-language-server?tab=readme-ov-file
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
      ensure_installed = { 'tmux' },
    },
  },
}
