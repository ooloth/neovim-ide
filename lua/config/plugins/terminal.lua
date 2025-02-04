local set = vim.keymap.set

set('t', '<esc>', '<c-\\><c-n>', { desc = 'Enter normal mode' })
set('t', '<c-h>', '<cmd>wincmd h<cr>', { desc = 'Go to left window' })
set('t', '<c-j>', '<cmd>wincmd j<cr>', { desc = 'Go to lower window' })
set('t', '<c-n>', '<cmd>wincmd j<cr>', { desc = 'Go to lower window' }) -- compensate for c-j outputting c-n on Air
set('t', '<c-k>', '<cmd>wincmd k<cr>', { desc = 'Go to upper window' })
set('t', '<c-p>', '<cmd>wincmd k<cr>', { desc = 'Go to upper window' }) -- compensate for c-k outputting c-p on Air
set('t', '<c-l>', '<cmd>wincmd l<cr>', { desc = 'Go to right window' })
set('t', '<c-/>', '<cmd>close<cr>', { desc = 'Hide Terminal' })
set('t', '<c-_>', '<cmd>close<cr>', { desc = 'which_key_ignore' })

return {
  require 'config.plugins.specs.snacks-terminal',
}
