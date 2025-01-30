-- TODO:
-- fidget: fix bg color

vim.opt.background = 'dark' -- colorschemes that can be light or dark will be made dark
vim.opt.breakindent = true
-- vim.opt.cmdheight = 0
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
vim.opt.cursorline = true -- highlight current line
vim.opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ', -- hide ~ at end of buffer
}
vim.opt.laststatus = 2 -- always show statusline
vim.opt.linebreak = true -- if wrapping lines visually, wrap at readable points
-- vim.opt.list = true -- show invisible whitespace characters (tabs, etc)
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- define whitespace indicators
vim.opt.number = false -- show absolute line numbers
vim.opt.pumblend = 10 -- popup blend transparency (%)
vim.opt.pumheight = 15 -- maximum number of entries in a popup
vim.opt.relativenumber = false -- show relative line numbers
vim.opt.scrolloff = 10 -- lines of context kept onscreen
vim.opt.shortmess:append { W = true, I = true, c = true, C = true } -- abbreviate some messages
vim.opt.showmode = false -- hide mode since it's already in the status line
vim.opt.sidescroll = 5
vim.opt.sidescrolloff = 8 -- columns of context kept onscreen
vim.opt.signcolumn = 'yes' -- always show signcolumn to avoid a layout shift
vim.opt.smoothscroll = true
vim.opt.splitbelow = true -- open horizontal splits below
vim.opt.splitkeep = 'screen'
vim.opt.splitright = true -- open vertical splits to the right
vim.opt.termguicolors = true -- support true colors
vim.opt.timeoutlen = 300 -- shorter mapped sequence wait time (displays which-key popup sooner)
vim.opt.winminwidth = 5 -- Minimum window width
vim.opt.wrap = false -- disable line wrap

vim.cmd [[
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline
]]

return {
  require 'config.plugins.specs.catppuccin',
  require 'config.plugins.specs.dressing',
  require 'config.plugins.specs.fidget',
  require 'config.plugins.specs.mini-clue',
  require 'config.plugins.specs.mini-statusline',
  require 'config.plugins.specs.noice',
  require 'config.plugins.specs.todo-comments',
  require 'config.plugins.specs.which-key',
}
