-- TODO: https://www.lazyvim.org/extras/lang/svelte
-- TODO: lsp?
-- TODO: formatting?
-- TODO: linting?
-- TODO: testing?
-- TODO: dap?

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'svelte' },
    },
  },
}
