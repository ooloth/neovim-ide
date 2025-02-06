-- custom filename -> filetype associations
vim.filetype.add {
  extension = {
    -- see: https://sbulav.github.io/vim/neovim-improving-work-with-terraform/#correctly-detecting-tf-filetype
    tf = 'terraform',
    tfvars = 'terraform',
    tfstate = 'json',
  },
  filename = {
    ['tsconfig.json'] = 'jsonc',
    -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#docker_compose_language_service
    ['docker-compose.yaml'] = 'yaml.docker-compose',
  },
  pattern = {
    ['docker-compose.*%.yaml'] = 'yaml.docker-compose',
    ['.*/kitty/.*%.conf'] = 'bash',
    ['.*/kitty/.*/.*%.conf'] = 'bash',
    ['.*/.vscode/.*%.json'] = 'jsonc',
    ['.*/vscode/.*%.json'] = 'jsonc',
  },
}

return {
  require 'config.plugins.specs.mini-ai',
  require 'config.plugins.specs.nvim-treesitter',
}
