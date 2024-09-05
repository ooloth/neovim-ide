-- TODO: https://www.lazyvim.org/extras/lang/yaml

local extend = require('config.util').extend

return {
  {
    'williamboman/mason-tool-installer.nvim',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'prettier', 'yaml-language-server' })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'yaml' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'b0o/schemastore.nvim' },
    opts = function(_, opts)
      extend(opts.servers, {
        yamlls = {
          settings = {
            yaml = {
              -- see: https://github.com/b0o/SchemaStore.nvim?tab=readme-ov-file#usage
              schemaStore = {
                -- You must disable built-in schemaStore support if you want to use
                -- this plugin and its advanced options like `ignore`.
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = '',
              },
              schemas = require('schemastore').yaml.schemas(),
            },
          },
        },
      })
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        yaml = { 'prettier' },
      },
    },
  },
}
