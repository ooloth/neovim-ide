--  TODO: lsp
--  TODO: linting
--  TODO: dap

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'rust' },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        rust = { 'rustfmt' },
      },
    },
  },

  {
    -- see: https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file#inbox_tray-installation
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {},
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- you can also put keymaps in here
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {},
          },
        },
        -- DAP configuration
        dap = {},
      }
    end,
  },
}
