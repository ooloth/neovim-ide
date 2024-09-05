-- TODO: https://www.lazyvim.org/extras/lang/vue

local extend = require('config.util').extend

return {
  {
    'williamboman/mason-tool-installer.nvim',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'prettier', 'vue-language-server' })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'vue' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      -- NOTE: linting comes from eslint-lsp (which already includes vue files by default)
      servers = {
        -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vuels
        vuels = {},
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        vue = { 'prettier' },
      },
    },
  },
}
