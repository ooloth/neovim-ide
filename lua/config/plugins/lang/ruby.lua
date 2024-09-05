-- TODO: nvim-lint: consider the default linter: ruby = { "ruby" },

local extend = require('config.util').extend

-- checkhealth
vim.cmd [[
  let g:loaded_ruby_provider = 0
]]

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'ruby' })
    end,
  },
}
