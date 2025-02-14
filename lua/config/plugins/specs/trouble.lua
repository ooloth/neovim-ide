-- TODO: any way to live grep the list? or should I just use a picker?

return {
  'folke/trouble.nvim',
  opts = {
    -- see: https://github.com/folke/trouble.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    focus = true, -- focus Trouble window when it opens
    indent_guides = false,
    keys = {
      ['<esc>'] = 'close',
      e = {
        action = function(view) view:filter({ buf = 0 }, { toggle = true }) end,
        desc = 'Toggle Current Buffer Filter',
      },
    },
    modes = {
      diagnostics = {
        format = '{severity_icon}{message:md} {item.source} {code} {filename} {pos}',
        groups = {}, -- no tree view (every line is actionable)
      },
      todo = {
        -- see: https://github.com/folke/todo-comments.nvim/blob/main/lua/trouble/sources/todo.lua
        groups = {}, -- no tree view (every line is actionable)
        format = '{todo_icon} {text} {filename} {pos}',
        sort = { 'tag', 'filename', 'pos', 'message' },
      },
    },
    open_no_results = true, -- open the trouble window when there are no results
    warn_no_results = false, -- show a warning when there are no results
  },
  keys = {
    { '<leader>x', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (all)' },
  },
}
