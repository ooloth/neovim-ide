-- TODO: folding: Code Folding in Neovim: https://www.youtube.com/watch?v=f_f08KnAJOQ (recommends nvim-ufo over other options like treesitter)
-- TODO: folding: https://github.com/kevinhwang91/nvim-ufo
-- TODO: folding: Configuring nvim-ufo to use LSP with lazy.nvim: https://www.reddit.com/r/neovim/comments/12yomtj/configuring_nvimufo_to_use_lsp_with_lazynvim/

vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldtext = ''
vim.opt.mouse = '' -- disable mouse mode (use 'a' to enable)
vim.opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
vim.opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode

local set = vim.keymap.set

-- TODO: use this helper instead to eliminate most of the 'n' and '{ desc = ... }' used in the `set` calls?
-- or keep it simple by avoiding creating yet another abstracting to memorize/override, etc?
local map = function(lhs, rhs, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, lhs, rhs, { desc = desc, expr = true, silent = true })
end

-- swap : and ,
set({ 'n', 'v' }, ',', ':') -- enter command mode with , instead of :
set({ 'n', 'v' }, ':', ',') -- navigate f and t results using ;/: (like n/N for / results)

-- better up/down navigation
set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- navigate to beginning + end of line
set({ 'n', 'v' }, '<S-h>', '^', { silent = true })
set({ 'n', 'v' }, '<S-l>', '$', { silent = true })

-- navigate changes
set('n', ']c', 'g,', { desc = 'Next change' }) -- go to next change with g;
set('n', '[c', 'g;', { desc = 'Prev change' }) -- go to next change with g;
set('n', 'g;', 'g,', { desc = 'Next change' }) -- go to next change with g;
set('n', 'g:', 'g;', { desc = 'Prev change' }) -- go to previous change with g;

-- navigate editors (buffers)
-- WARN: don't add c-[] maps (c-[ means ESC; c-] navigates to :help keywords)
set('n', '<tab>', '<cmd>bn<cr>', { desc = 'Next editor' })
set('n', '<s-tab>', '<cmd>bp<cr>', { desc = 'Prev editor' })
set('n', '<leader>`', '<cmd>e#<cr>', { desc = 'Other editor' }) -- switch to last buffer
set('n', '<leader>ed', '<cmd>bp|bd #<cr>', { desc = 'Close editor' }) -- close buffer but not window
-- Close all buffers except the current one (like leader-wo does for windows):
-- https://stackoverflow.com/a/42071865/8802485
set('n', '<leader>eo', '<cmd>%bd|e#|bd#<cr>', { desc = 'Only keep this editor' })

-- navigate to location list
set('n', 'gl', '<cmd>lopen<cr>', { desc = 'Location list' })
set('n', '<leader>ol', '<cmd>lopen<cr>', { desc = 'Location list' }) -- use ]l + [l to navigate

-- navigate to quickfix list
set('n', 'gq', '<cmd>botright copen<cr>', { desc = 'Quickfix list' })
set('n', '<leader>oq', '<cmd>copen<cr>', { desc = 'Quickfix list' }) -- use ]q + [q to navigate

-- navigate out of neovim
set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- navigate tabs
set('n', ']<tab>', '<cmd>tabnext<cr>', { desc = 'Next tab' })
set('n', '[<tab>', '<cmd>tabprevious<cr>', { desc = 'Next tab' })
set('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New tab' })
set('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next tab' })
set('n', '<leader><tab>n', '<cmd>tabnext<cr>', { desc = 'Next tab' })
set('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Prev tab' })
set('n', '<leader><tab>p', '<cmd>tabprevious<cr>', { desc = 'Prev tab' })
set('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Close other tabs' })
set('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close tab' })
set('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First tab' })
set('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last tab' })

-- "window"
-- TODO: map all <c-w> commands?
set('n', '<leader>\\', '<c-w>v', { desc = 'Split right' })
set('n', '<leader>w\\', '<c-w>v', { desc = 'Split right' })
set('n', '<leader>-', '<c-w>s', { desc = 'Split below' })
set('n', '<leader>w-', '<c-w>s', { desc = 'Split below' })
set('n', '<leader>=', '<c-w>=', { desc = 'Resize equally' })
set('n', '<leader>w=', '<c-w>=', { desc = 'Resize equally' })
set('n', '<leader>[', '<cmd>vertical resize -3<cr>', { desc = 'Reduce size' })
set('n', '<leader>w[', '<cmd>vertical resize -3<cr>', { desc = 'Reduce size' })
set('n', '<leader>]', '<cmd>vertical resize +3<cr>', { desc = 'Increase size' })
set('n', '<leader>w]', '<cmd>vertical resize +3<cr>', { desc = 'Increase size' })
set('n', '<leader>wd', '<c-w>c', { desc = 'Delete Window', remap = true })
-- TODO: "leader-wm" = toggle maximize window (see vim-maximizer.lua}
-- set("n", "<leader>wm", function() LazyVim.toggle.maximize() end, { desc = "Maximize Toggle" })
set('n', '<leader>wo', '<c-w>o', { desc = 'Only keep this one' })
set('n', '<leader>wt', '<cmd>tab split<cr>', { desc = 'Open in new tab' })
set('n', '<leader>ww', '<c-w>p', { desc = 'Other Window', remap = true })
-- TODO: "leader-ww" = pick window (see nvim-window-picker.lua)?

-- new file
set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })
set('n', '<leader>on', ':ene <BAR> startinsert<cr>', { desc = 'New file' })

-- lazy
set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

set('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
set('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })

set('n', '[q', vim.cmd.cprev, { desc = 'Prev Quickfix' })
set('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
set('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
set('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
set('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
set('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
set('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
set('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
set('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
set('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

return {
  require 'config.plugins.specs.mini-files', -- file system editor + explorer
  require 'config.plugins.specs.persistence', -- session manager
  require 'config.plugins.specs.vim-tmux-navigator', -- move across vim + tmux windows with c-jkhl
}
