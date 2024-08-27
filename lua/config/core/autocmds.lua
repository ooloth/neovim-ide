-- see: https://neovim.io/doc/user/autocmd.html

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.cmd [[
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline
]]

-- override nvim runtime filetype "ro" settings that add a comment leader to newlines below a comment:
-- https://neovim.discourse.group/t/options-formatoptions-not-working-when-put-in-init-lua/3746/5
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove 'r'
    vim.opt.formatoptions:remove 'o'
  end,
})

-- TODO: wait for lsp server to attach (move to lsp.lua?)
-- show line diagnostics in floating window while cursor is on line
-- see: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})
