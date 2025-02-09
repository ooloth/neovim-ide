return {
  'folke/trouble.nvim',
  opts = {
    -- see: https://github.com/folke/trouble.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    -- for default options, refer to the configuration section for custom setup.
    --     auto_close = true,
    --     height = 14,
  },
  cmd = 'Trouble',
  keys = {
    { '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP Definitions / references / ... (Trouble)' },
    { '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
    { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
    { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
    { '<leader>xa', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (all)' },
    { '<leader>xx', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Diagnostics (editor)' },
    -- { '<leader>xx', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Diagnostics (file)' },
    -- { '<leader>xa', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Diagnostics (all)' },
    -- { '<leader>xX', false },
    -- { '<leader>xL', false },
    -- { '<leader>xQ', false },
  },
  init = function()
    vim.keymap.set('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
    vim.keymap.set('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })
  end,
}
