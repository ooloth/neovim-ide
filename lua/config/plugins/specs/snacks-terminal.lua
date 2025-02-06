---@module "snacks"

return {
  'folke/snacks.nvim',
  opts = {
    terminal = {},
  },
  keys = {
    -- stylua: ignore start 
    { "<c-t>", mode = {'n', 't'}, function() Snacks.terminal.toggle() end, desc = "Toggle Terminal" },
    -- stylua: ignore end
  },
}
