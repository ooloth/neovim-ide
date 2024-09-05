local extend = require('config.util').extend

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'gleam' })
    end,
  },
}
