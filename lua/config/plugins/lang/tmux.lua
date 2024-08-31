--  TODO: lsp: https://github.com/Freed-Wu/tmux-language-server?tab=readme-ov-file
--  TODO: formatting?
--  TODO: linting?

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, { 'tmux' })
    end,
  },
}
