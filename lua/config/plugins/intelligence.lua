local set = vim.keymap.set

set('n', '<leader>ic', vim.show_pos, { desc = 'Inspect Pos' })

return {
  require 'config.plugins.specs.codecompanion',
  require 'config.plugins.specs.conform',
  require 'config.plugins.specs.copilot',
  require 'config.plugins.specs.nvim-lint',
  require 'config.plugins.specs.trouble',
}
