-- TODO: https://www.lazyvim.org/plugins/editor#todo-commentsnvim
-- NOTE: testing
-- WARN: testing
-- FIX: testing

return {
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    -- see: https://github.com/folke/todo-comments.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    gui_style = {
      fg = 'NONE', -- The gui style to use for the fg highlight group.
      bg = 'NONE', -- The gui style to use for the bg highlight group.
    },
    highlight = {
      after = 'fg',
      keyword = 'fg',
      multiline = true, -- highlight the entire block?
    },
    signs = false,
  },
  init = function()
    vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = 'Todo' })
  end,
}
