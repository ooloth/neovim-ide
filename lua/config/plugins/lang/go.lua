-- TODO: https://www.lazyvim.org/extras/lang/go
-- TODO: lsp
-- TODO: linting
-- TODO: dap

local extend = require('config.util').extend

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'go' })
    end,
  },
}

-- install all the formatters
-- require('mason-tool-installer').setup({ ensure_installed = { 'gofumpt', 'goimports', 'gci' } })
-- vim.api.nvim_command('MasonToolsInstall')

-- -- formatting (see: https://github.com/stevearc/conform.nvim#setup)
-- require('conform').setup({
--   formatters_by_ft = {
--     go = { 'gofumpt', 'goimports', 'gci' },
--   },
-- })
