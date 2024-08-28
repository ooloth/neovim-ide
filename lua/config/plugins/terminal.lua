local set = vim.keymap.set

set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Enter normal mode' }) -- FIXME: causes a timeoutlen delay closing floaterm buffers; exclude them from this handy shortcut?
set('t', '<c-h>', '<cmd>wincmd h<cr>', { desc = 'Go to left window' })
set('t', '<c-j>', '<cmd>wincmd j<cr>', { desc = 'Go to lower window' })
set('t', '<c-k>', '<cmd>wincmd k<cr>', { desc = 'Go to upper window' })
set('t', '<c-l>', '<cmd>wincmd l<cr>', { desc = 'Go to right window' })
set('t', '<c-/>', '<cmd>close<cr>', { desc = 'Hide Terminal' })
set('t', '<c-_>', '<cmd>close<cr>', { desc = 'which_key_ignore' })

return {
  require 'config.plugins.specs.floaterm',
}
