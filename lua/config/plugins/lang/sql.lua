-- TODO: https://www.lazyvim.org/extras/lang/sql
-- TODO: lsp?
-- TODO: formatting?
-- TODO: linting?

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'sql' },
    },
  },
}
