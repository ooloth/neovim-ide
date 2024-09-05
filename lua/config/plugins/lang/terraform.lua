-- TODO: https://www.lazyvim.org/xtras/lang/terraform
-- TODO: nvim-lint: consider the default linter: terraform = { "tflint" },

local extend = require('config.util').extend

return {
  {
    'williamboman/mason-tool-installer.nvim',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'terraform-ls', 'tflint' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = function(_, opts)
      -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
      extend(opts.servers, { terraformls = {} })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'hcl', 'terraform' })
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        terraform = { 'terraform_fmt' },
        ['terraform-vars'] = { 'terraform_fmt' },
        tf = { 'terraform_fmt' },
      },
    },
  },

  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        terraform = { 'tflint' },
        tf = { 'tflint' },
      },
    },
  },
}
