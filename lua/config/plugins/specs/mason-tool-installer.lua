-- see: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim

return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim', -- so mason installations will be possible
    'williamboman/mason-lspconfig.nvim', -- so lspconfig + mason names will both work
  },
}
