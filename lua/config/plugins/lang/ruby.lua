-- TODO: nvim-lint: consider the default linter: ruby = { "ruby" },

-- checkhealth
vim.cmd [[
  let g:loaded_ruby_provider = 0
]]

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
      ensure_installed = { 'ruby' },
    },
  },
}
