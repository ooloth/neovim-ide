-- Adds git-related signs to the left gutter
-- See `:help gitsigns`

return {
  'lewis6991/gitsigns.nvim',
  event = 'BufRead',
  opts = {
    -- see: https://github.com/lewis6991/gitsigns.nvim?tab=readme-ov-file#installation--usage
    current_line_blame = true, -- toggle with `:Gitsigns toggle_current_line_blame`
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(buffer)
      -- see: https://github.com/lewis6991/gitsigns.nvim?tab=readme-ov-file#keymaps
      local gs = require 'gitsigns'

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

    -- stylua: ignore start
    map('n', '<leader>gb', function() gs.blame_line { full = true } end, 'Blame (full)')
    map('n', '<leader>gtb', gs.toggle_current_line_blame, 'Line blame')
    map('n', '<leader>gtd', gs.toggle_deleted, 'Deleted lines')
    end,
  },
}
