---@module "snacks"

return {
  'folke/snacks.nvim',
  opts = {
    zen = {
      enabled = true,
    },
    styles = {
      zoom_indicator = {
        text = ' 󰊓 ZOOMED 󰊓   ',
        minimal = false,
      },
    },
  },
  keys = {
    { '<leader>wm', function() Snacks.zen.zoom() end, desc = 'Maximize (toggle)' },
  },
}
