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

-- Don't start newlines below comments with comment syntax
-- https://neovim.discourse.group/t/options-formatoptions-not-working-when-put-in-init-lua/3746/5
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove 'r'
    vim.opt.formatoptions:remove 'o'
  end,
})

return {
  require 'config.plugins.specs.guess-indent',
  require 'config.plugins.specs.mini-pairs',
  require 'config.plugins.specs.nvim-cmp',
}
