return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  ft = { 'markdown', 'codecompanion' }, -- see: https://codecompanion.olimorris.dev/configuration/chat-buffer.html#markdown-rendering
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
}
