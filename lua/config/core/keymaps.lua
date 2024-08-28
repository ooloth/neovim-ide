-- see: https://www.lazyvim.org/configuration/general#keymaps

local set = vim.keymap.set

-------------
-- GENERAL --
-------------

-- swap : and ,
set({ 'n', 'v' }, ',', ':') -- enter command mode with , instead of :
set({ 'n', 'v' }, ':', ',') -- navigate f and t results using ;/: (like n/N for / results)

------------------
-- ALPHABETICAL --
------------------

-- "debugger" (see dap.lua)
-- "git" (see git.lua)
-- "help" (see telescope.lua)
-- "inspect" / "info"
-- highlights under cursor
set('n', '<leader>ic', vim.show_pos, { desc = 'Inspect Pos' })
-- "lazy" / "LSP" (see lsp.lua)
-- "mason" (see lsp.lua)
-- "pin" (see mini-bufremove.lua + bufferline.lua)

-- "replace" (see spectre.lua + lsp.lua)

-- "save"
set('n', '<leader><space>', '<cmd>w<cr>', { desc = 'Save' })

-- "ui"
-- "v"
-- "x" ("diagnostics")
-- "y"
-- "z"

-- Resize window using <ctrl> arrow keys
set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Move Lines
set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Clear search with <esc>
set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and Clear hlsearch' })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
set('n', '<leader>ur', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>', { desc = 'Redraw / Clear hlsearch / Diff Update' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
set('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
set('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

-- Add undo break-points
set('i', ',', ',<c-g>u')
set('i', '.', '.<c-g>u')
set('i', ';', ';<c-g>u')

-- save file
set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

--keywordprg
set('n', '<leader>K', '<cmd>norm! K<cr>', { desc = 'Keywordprg' })

-- better indenting
set('v', '<', '<gv')
set('v', '>', '>gv')

-- commenting
set('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
set('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

-- lazy
set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- new file
set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })
set('n', '<leader>on', ':ene <BAR> startinsert<cr>', { desc = 'New file' })

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

-- stylua: ignore start

-- toggle options
-- set("n", "<leader>uf", function() LazyVim.format.toggle() end, { desc = "Toggle Auto Format (Global)" })
-- set("n", "<leader>uF", function() LazyVim.format.toggle(true) end, { desc = "Toggle Auto Format (Buffer)" })
-- set("n", "<leader>us", function() LazyVim.toggle("spell") end, { desc = "Toggle Spelling" })
-- set("n", "<leader>uw", function() LazyVim.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- set("n", "<leader>uL", function() LazyVim.toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
-- set("n", "<leader>ul", function() LazyVim.toggle.number() end, { desc = "Toggle Line Numbers" })
-- set("n", "<leader>ud", function() LazyVim.toggle.diagnostics() end, { desc = "Toggle Diagnostics" })
-- local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
-- set("n", "<leader>uc", function() LazyVim.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
-- if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
--   set( "n", "<leader>uh", function() LazyVim.toggle.inlay_hints() end, { desc = "Toggle Inlay Hints" })
-- end
-- set("n", "<leader>uT", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })
-- set("n", "<leader>ub", function() LazyVim.toggle("background", false, {"light", "dark"}) end, { desc = "Toggle Background" })

-- -- lazygit
-- set("n", "<leader>gg", function() LazyVim.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
-- set("n", "<leader>gG", function() LazyVim.lazygit() end, { desc = "Lazygit (cwd)" })
-- set("n", "<leader>gb", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })
-- set("n", "<leader>gB", LazyVim.lazygit.browse, { desc = "Git Browse" })

-- set("n", "<leader>gf", function()
--   local git_path = vim.api.nvim_buf_get_name(0)
--   LazyVim.lazygit({args = { "-f", vim.trim(git_path) }})
-- end, { desc = "Lazygit Current File History" })

-- set("n", "<leader>gl", function()
--   LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
-- end, { desc = "Lazygit Log" })
-- set("n", "<leader>gL", function()
--   LazyVim.lazygit({ args = { "log" } })
-- end, { desc = "Lazygit Log (cwd)" })
