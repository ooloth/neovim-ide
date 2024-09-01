vim.cmd [[
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline
]]

return {
  require 'config.plugins.specs.bufferline',
  require 'config.plugins.specs.catppuccin',
  require 'config.plugins.specs.fidget',
  require 'config.plugins.specs.todo-comments',
}
