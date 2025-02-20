-- TODO: https://www.lazyvim.org/extras/lang/helm

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'helm' },
    },
  },
}
