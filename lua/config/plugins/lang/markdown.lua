-- TODO: https://www.lazyvim.org/extras/lang/markdown

local extend = require('config.util').extend

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

return {
  -- {
  --   'williamboman/mason-tool-installer.nvim',
  --   opts = function(_, opts)
  --     extend(opts.ensure_installed, { 'markdownlint' })
  --   end,
  -- },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'markdown', 'markdown_inline', 'mermaid' })
    end,
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
}
