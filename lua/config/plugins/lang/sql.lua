-- TODO: https://www.lazyvim.org/extras/lang/sql
-- TODO: lsp?
-- TODO: formatting?
-- TODO: linting?

local extend = require('config.util').extend

return {
  -- {
  --   'williamboman/mason-tool-installer.nvim',
  --   opts = function(_, opts)
  --     extend(opts.ensure_installed, { 'prettier' })
  --   end,
  -- },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'sql' })
    end,
  },

  -- {
  --   'neovim/nvim-lspconfig',
  --   opts = {
  --     servers = {
  --     },
  --   },
  -- },

  -- {
  --   'stevearc/conform.nvim',
  --   opts = {
  --     formatters_by_ft = {
  --     },
  --   },
  -- },
}
