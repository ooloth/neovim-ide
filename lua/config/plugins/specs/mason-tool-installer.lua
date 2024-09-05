-- see: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim

return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim', -- so mason installations will be possible
    'williamboman/mason-lspconfig.nvim', -- so lspconfig + mason names will both work
  },
  opts_extend = { 'ensure_installed' }, -- extend this list-like option when merging configs (see: https://github.com/folke/lazy.nvim/discussions/1706#discussioncomment-10268907)
}
