-- Adds git-related signs to the left gutter
-- See `:help gitsigns`

return {
  'lewis6991/gitsigns.nvim',
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
  },
}
