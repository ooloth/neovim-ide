---@module "snacks"

return {
  'folke/snacks.nvim',
  opts = {
    zen = {},
    styles = {
      zoom_indicator = {
        text = ' 󰊓 ZOOMED 󰊓   ',
        minimal = false,
      },
    },
  },
  keys = {
    { '<leader>em', function() Snacks.zen.zoom() end, desc = 'Maximize (toggle)' },
    { '<leader>wm', function() Snacks.zen.zoom() end, desc = 'Maximize (toggle)' },
  },
}
