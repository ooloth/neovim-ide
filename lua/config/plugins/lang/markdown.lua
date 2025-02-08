-- TODO: https://www.lazyvim.org/extras/lang/markdown

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

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
      ensure_installed = { 'markdown', 'markdown_inline', 'mermaid' },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#marksman
        marksman = {},
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        markdown = { 'inject', 'prettier' },
        ['markdown.mdx'] = { 'prettier' },
      },
    },
  },

  -- Prettier markdown rendering in normal mode
  require 'config.plugins.specs.render-markdown',
}
