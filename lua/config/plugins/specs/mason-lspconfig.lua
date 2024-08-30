-- TODO: https://www.lazyvim.org/plugins/lsp

return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    require 'config.plugins.specs.mason',
  },
  -- NOTE: LSP handler defined in nvim-lspconfig.lua
  opts = {},
}
