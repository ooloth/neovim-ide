return {
  'declancm/maximize.nvim',
  keys = {
    { '<leader>wm', function() require('maximize').toggle() end, desc = 'Maximize (toggle)' },
  },
  opts = {},
}
