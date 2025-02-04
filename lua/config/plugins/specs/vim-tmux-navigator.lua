-- navigate vim splits (and tmux panes) with <C-hjkl>

return {
  'christoomey/vim-tmux-navigator',
  event = 'VeryLazy',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
  },
  keys = {
    { '<c-h>', '<cmd><c-u>TmuxNavigateLeft<cr>' },
    { '<c-j>', '<cmd>TmuxNavigateDown<cr>' },
    { '<c-n>', '<cmd>TmuxNavigateDown<cr>' }, -- compensate for c-j outputting c-n on Air
    { '<c-k>', '<cmd>TmuxNavigateUp<cr>' },
    { '<c-p>', '<cmd>TmuxNavigateUp<cr>' }, -- compensate for c-k outputting c-p on Air
    { '<c-l>', '<cmd><c-u>TmuxNavigateRight<cr>' },
    { '<c-\\>', '<cmd><c-u>TmuxNavigatePrevious<cr>' },
  },
}
