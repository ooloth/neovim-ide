-- TODO: nvim-lint: consider the default linter: ruby = { "ruby" },

-- checkhealth
vim.cmd([[
  let g:loaded_ruby_provider = 0
]])

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'ruby' },
    },
  },
}
