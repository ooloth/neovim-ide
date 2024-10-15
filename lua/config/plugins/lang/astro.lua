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
      -- see: https://github.com/virchau13/tree-sitter-astro/#troubleshooting
      ensure_installed = { 'astro', 'css', 'typescript', 'tsx' },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#astro
        astro = {},
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        -- Also need to install prettier-plugin-astro in project
        -- see: https://github.com/withastro/prettier-plugin-astro#installation
        astro = { 'prettier' },
      },
    },
  },
}
