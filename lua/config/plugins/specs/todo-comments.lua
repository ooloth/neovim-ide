-- TODO: https://www.lazyvim.org/plugins/editor#todo-commentsnvim
-- NOTE: testing
-- FIXME: testing
-- WARN: testing
-- FIX: testing
-- HACK: testing
-- PERF: testing

return {
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    -- FIXME: doesn't do anything yet
    -- see: https://github.com/folke/todo-comments.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    gui_style = {
      fg = 'NONE', -- The gui style to use for the fg highlight group.
      bg = 'NONE', -- The gui style to use for the bg highlight group.
    },
    highlight = {
      after = 'fg',
      -- after = '',
      keyword = 'fg',
      multiline = false,
    },
    signs = false,
  },
  init = function()
    vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = 'Todo' })
  end,
}
