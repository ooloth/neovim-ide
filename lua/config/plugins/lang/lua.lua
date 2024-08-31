-- TODO: linting
-- TODO: debugging: https://www.lazyvim.org/extras/dap/nlua

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, { 'lua', 'luadoc', 'luap' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = 'Replace',
              },
              doc = {
                privateName = { '^_' },
              },
              hint = {
                arrayIndex = 'Disable',
                enable = true,
                paramType = true,
                paramName = 'Disable',
                semicolon = 'Disable',
                setType = false,
              },
              workspace = {
                checkThirdParty = false,
              },
            },
          },
        },
      },
    },
  },

  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  { 'Bilal2453/luvit-meta', lazy = true },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = { lua = { 'stylua' } },
    },
  },

  -- {
  --   -- see: https://github.com/mfussenegger/nvim-lint
  --   'mfussenegger/nvim-lint',
  --   opts = {
  --     -- see: https://www.lazyvim.org/plugins/linting#nvim-lint
  --     -- see: https://github.com/mfussenegger/nvim-lint#available-linters
  --     linters_by_ft = {
  --       lua = { 'luacheck' },
  --     },
  --   },
  -- },
}
