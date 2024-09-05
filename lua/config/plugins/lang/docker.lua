-- TODO: formatting?
-- TODO: treesitter?
-- TODO: linting?
-- TODO: nvim-lint: consider the default linter: dockerfile = { "hadolint" },
-- TODO: https://www.lazyvim.org/extras/lang/docker

local extend = require('config.util').extend

return {
  {
    'williamboman/mason-tool-installer.nvim',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'prettier' })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      -- see: https://github.com/virchau13/tree-sitter-astro/#troubleshooting
      extend(opts.ensure_installed, { 'dockerfile' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls
      dockerls = {},
    },
  },

  -- {
  --   'stevearc/conform.nvim',
  --   opts = {
  --     formatters_by_ft = {},
  --   },
  -- },
}
