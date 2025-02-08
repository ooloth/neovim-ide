return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    -- see: https://codecompanion.olimorris.dev/installation.html#installation-1
    {
      'nvim-lua/plenary.nvim',
      branch = 'master', -- resolves "buffer not modifiable" after first chat question: https://github.com/olimorris/codecompanion.nvim/issues/377#issuecomment-2443121875
    },
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<Leader>a,', '<cmd>CodeCompanionActions<cr>', desc = 'CodeCompanion actions', mode = { 'n', 'v' } },
    { '<Leader>aa', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'Chat editor (toggle)', mode = { 'n', 'v' } },
    { '<Leader>ai', '<cmd>CodeCompanion<cr>', desc = 'Inline assistant', mode = { 'n', 'v' } },
    { '<Leader>as', '<cmd>CodeCompanionChat Add<cr>', desc = 'Send selection to chat', mode = 'v' },
  },
  opts = {
    strategies = {
      chat = {
        keymaps = {
          close = {
            modes = { n = { '<esc>' }, i = '<c-c>' },
          },
          completion = {
            modes = { i = '<c-s>' },
          },
          send = {
            modes = { n = '<cr>', i = '<c-cr>' },
          },
        },
      },
    },
  },
  init = function()
    vim.cmd [[cab cc CodeCompanion]] -- expand 'cc' into 'CodeCompanion' in the neovim command prompt
  end,
}
