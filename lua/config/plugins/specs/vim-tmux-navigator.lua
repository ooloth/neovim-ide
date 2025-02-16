-- navigate vim splits (and tmux panes) with <C-hjkl>

return {
  'christoomey/vim-tmux-navigator',
  event = 'VeryLazy',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateRight',
    'TmuxNavigateUp',
    'TmuxNavigateDown',
    'TmuxNavigatePrevious',
  },
  keys = {
    { '<c-h>', '<cmd>TmuxNavigateLeft<cr>', mode = { 'n', 'v' } },
    { '<c-l>', '<cmd>TmuxNavigateRight<cr>', mode = { 'n', 'v' } },
    { '<c-k>', '<cmd>TmuxNavigateUp<cr>', mode = { 'n', 'v' } },
    { '<c-p>', '<cmd>TmuxNavigateUp<cr>', mode = { 'n', 'v' } }, -- compensate for c-k outputting c-p on Air
    { '<c-j>', '<cmd>TmuxNavigateDown<cr>', mode = { 'n', 'v' } },
    { '<c-n>', '<cmd>TmuxNavigateDown<cr>', mode = { 'n', 'v' } }, -- compensate for c-j outputting c-n on Air
    { '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>', mode = { 'n', 'v' } },
  },
}
