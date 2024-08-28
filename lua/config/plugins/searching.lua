-- clear search highlights
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<CR><Esc>', { silent = true })

return {
  require 'config.plugins.specs.telescope',
}
