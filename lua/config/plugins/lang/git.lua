-- TODO: https://www.lazyvim.org/extras/lang/git
-- TODO: lsp?
-- TODO: linting?
-- TODO: formatting?

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'diff', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore' },
    },
  },
}
