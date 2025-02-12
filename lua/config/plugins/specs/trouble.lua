return {
  'folke/trouble.nvim',
  opts = {
    -- see: https://github.com/folke/trouble.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    focus = true, -- focus Trouble window when it opens
    indent_guides = false,
    keys = {
      ['<esc>'] = 'close',
      e = {
        action = function(view) view:filter({ buf = 0 }, { toggle = true }) end,
        desc = 'Toggle Current Buffer Filter',
      },
    },
    modes = {
      diagnostics = {
        format = '{severity_icon}{message:md} {item.source} {code} {filename} {pos}',
        groups = {}, -- no tree view (every line is actionable)
      },
    },
    open_no_results = true, -- open the trouble window when there are no results
    warn_no_results = false, -- show a warning when there are no results
  },
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
