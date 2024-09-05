-- TODO: https://www.lazyvim.org/extras/lang/helm

local extend = require('config.util').extend

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      extend(opts.ensure_installed, { 'helm' })
    end,
  },
}
