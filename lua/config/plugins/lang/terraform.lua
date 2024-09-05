-- TODO: https://www.lazyvim.org/xtras/lang/terraform

return {
  {
    'williamboman/mason-tool-installer.nvim',
    opts = {
      ensure_installed = { 'tflint' },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'hcl', 'terraform' },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        terraformls = {},
      },
    },
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
