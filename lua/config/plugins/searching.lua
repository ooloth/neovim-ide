vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.ignorecase = true -- if only lowercase-only, search is case-insensitive
vim.opt.smartcase = true -- if any capital letters, search is case-sensitive

-- Clear search highlights on ESC
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<CR><Esc>', { silent = true })

return {
  require 'config.plugins.specs.telescope',
}
