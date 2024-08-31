-- TODO: https://www.lazyvim.org/extras/lang/markdown
-- TODO: lint: https://medium.com/rewrite-tech/the-fun-way-to-improve-your-documentation-part-one-markdownlint-20991ee1df91
-- TODO: lint: https://medium.com/rewrite-tech/the-fun-way-to-improve-your-documentation-part-two-vale-74ef371198b2

local extend = require('config.util').extend

return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'markdownlint', 'vale' })
    end,
  },

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
        vale_ls = {},
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

  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        markdown = { 'markdownlint', 'vale' },
        -- NOTE: eslint_lsp already lints MDX files (install https://github.com/mdx-js/eslint-mdx in project)
      },
    },
  },
}
