-- checkhealth
vim.cmd([[
  let g:loaded_perl_provider = 0
]])

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'perl' },
    },
  },
}
