--  TODO: lsp?
--  TODO: formatting?
--  TODO: linting?

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'rego' },
    },
  },
}
