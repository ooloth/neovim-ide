return {
  'garymjr/nvim-snippets',
  keys = {
    {
      '<C-l>',
      function() return vim.snippet.active { direction = 1 } and '<cmd>lua vim.snippet.jump(1)<cr>' or '<Tab>' end,
      expr = true,
      silent = true,
      mode = { 'i', 's' },
    },
    {
      '<C-h>',
      function() return vim.snippet.active { direction = -1 } and '<cmd>lua vim.snippet.jump(-1)<cr>' or '<S-Tab>' end,
      expr = true,
      silent = true,
      mode = { 'i', 's' },
    },
  },
}
