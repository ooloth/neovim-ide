-- TODO: formatting?
-- TODO: linting?
-- TODO: nvim-lint: consider the default linter: dockerfile = { "hadolint" },
-- TODO: https://www.lazyvim.org/extras/lang/docker

return {
  -- {
  --   'williamboman/mason-tool-installer.nvim',
  --   opts = {
  --     ensure_installed = {},
  --   },
  -- },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'dockerfile' },
    },
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
