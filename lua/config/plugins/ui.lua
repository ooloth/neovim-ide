vim.cmd [[
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline
]]

return {
  require 'config.plugins.specs.catppuccin',
  require 'config.plugins.specs.fidget',
}
