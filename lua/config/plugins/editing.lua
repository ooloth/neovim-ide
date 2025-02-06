vim.opt.autoindent = true -- copy indent from current line when starting new one
-- vim.opt.autowrite = true -- Enable auto write
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

-- Sync clipboard between OS and Neovim (after `UiEnter` because it can increase startup-time)
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
  -- Sync with vim + system clipboards if not in SSH session
  -- vim.opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
end)

local autocmd = vim.api.nvim_create_autocmd
local set = vim.keymap.set

-- better indenting
set('v', '<', '<gv')
set('v', '>', '>gv')

-- commenting
set('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
set('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

-- Move Lines
set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Add undo break-points
set('i', ',', ',<c-g>u')
set('i', '.', '.<c-g>u')
set('i', ';', ';<c-g>u')

-- TODO: can I debounce so this waits 5 seconds before firing (and skips multiples in the meantime)?
autocmd({ 'BufLeave', 'FocusLost', 'InsertLeave' }, {
  -- autocmd({ 'BufLeave', 'FocusLost', 'InsertLeave', 'TextChanged' }, {
  desc = 'Auto save',
  callback = function()
    if vim.bo.filetype ~= '' and vim.bo.buftype == '' then
      vim.api.nvim_command 'update'
      -- vim.api.nvim_command 'silent update'
    end
  end,
  nested = true, -- to support format on save
})

-- TODO: confirm if this solves the lazygit change discarding issue
autocmd('FocusGained', {
  desc = 'Update buffer when there are file changes',
  callback = function()
    vim.cmd 'checktime'
  end,
})

-- -- -- TODO: apply when opening to an empty buffer
-- -- autocmd('VimEnter', {
-- --   desc = "Open Snacks picker when it's a Directory",
-- --   callback = function(data)
-- --     local buffer_is_a_directory = vim.fn.isdirectory(data.file) == 1
-- --
--     -- change to the directory
--     if buffer_is_a_directory then
--       vim.cmd.cd(data.file)
--       vim.cmd 'lua Snacks.picker.smart()'
--     end
--   end,
-- })

-- TODO: move to after/ftplugin?
autocmd('FileType', {
  desc = 'Set shiftwidth to 4 in these filetypes',
  pattern = { 'c', 'cpp', 'py', 'java', 'cs' },
  callback = function()
    vim.bo.shiftwidth = 4
  end,
})

-- Don't prefix comment characters to newlines after comments
-- https://neovim.discourse.group/t/options-formatoptions-not-working-when-put-in-init-lua/3746/5
autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove { 'r', 'o' }
    -- vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

return {
  require 'config.plugins.specs.guess-indent',
  require 'config.plugins.specs.inc-rename',
  require 'config.plugins.specs.mini-pairs',
  require 'config.plugins.specs.mini-surround',
  require 'config.plugins.specs.netrw',
  require 'config.plugins.specs.nvim-cmp',
}
