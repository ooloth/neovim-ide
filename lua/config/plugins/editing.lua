vim.opt.autoindent = true -- copy indent from current line when starting new one
-- vim.opt.autowrite = true -- Enable auto write

-- Sync clipboard between OS and Neovim (after `UiEnter` because it can increase startup-time)
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
  -- Sync with vim + system clipboards if not in SSH session
  -- vim.opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
end)

vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.formatoptions = 'tcqjnl' -- default is 'tcqj' (see `:h fo-table`)
vim.opt.inccommand = 'nosplit' -- preview incremental substitute
vim.opt.shiftround = true -- round indent
vim.opt.shiftwidth = 2 -- rize of an indent
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.spell = false
vim.opt.spelllang = { 'en' }
vim.opt.spelloptions:append 'noplainbuffer'
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.undofile = true -- save undo history
vim.opt.undolevels = 10000
vim.opt.updatetime = 250 -- faster swap file saving and CursorHold triggering
vim.opt.wildmode = 'longest:full,full' -- command-line completion behavior

-- Highlight yanked text (see `:help vim.highlight.on_yank()`)
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Don't prefix comment characters to newlines after comments
-- https://neovim.discourse.group/t/options-formatoptions-not-working-when-put-in-init-lua/3746/5
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove 'r'
    vim.opt.formatoptions:remove 'o'
  end,
})

return {
  require 'config.plugins.specs.guess-indent',
  require 'config.plugins.specs.inc-rename',
  require 'config.plugins.specs.mini-pairs',
  require 'config.plugins.specs.mini-surround',
  require 'config.plugins.specs.nvim-cmp',
}
