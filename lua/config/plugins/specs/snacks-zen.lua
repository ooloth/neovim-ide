---@module "snacks"

return {
  'folke/snacks.nvim',
  opts = {
    zen = { enabled = true },
  },
  keys = {
    { '<leader>wm', function() Snacks.zen.zoom() end, desc = 'Maximize (toggle)' },
  },
}
