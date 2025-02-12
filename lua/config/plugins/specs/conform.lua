-- TODO: https://www.lazyvim.org/plugins/formatting
-- TODO: https://www.lazyvim.org/extras/formatting/prettier

-- see: https://github.com/stevearc/conform.nvim/blob/master/lua/conform/formatters/prettier.lua
-- see: https://www.lazyvim.org/extras/formatting/prettier

-- local prefer_node_modules_executable = require('util.prefer_node_modules').prefer_node_modules_executable

return {
  -- see: https://github.com/stevearc/conform.nvim
  'stevearc/conform.nvim',
  dependencies = {
    { 'williamboman/mason.nvim', opts = {} }, -- so mason installations will be possible
    'zapling/mason-conform.nvim',
  },
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>rf',
      function() require('conform').format({ async = true, lsp_fallback = true }) end,
      mode = '',
      desc = 'Format editor',
    },
  },
  opts = {
    -- see: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#setup
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters = {
      -- TODO: add support for more filetypes that have community plugins?
      -- see: https://prettier.io/docs/en/plugins.html#community-plugins
      -- prettier = function()
      --   return {
      --     command = require('conform.util').find_executable({
      --       'node_modules/bin/prettier',
      --     }, 'prettier'),
      --     --   command = prefer_node_modules_executable('prettier'),
      --     require_cwd = true, -- only activate if a config file is found
      --   }
      -- end,
    },
    formatters_by_ft = {
      -- use the "_" filetype to run formatters on filetypes that don't have other formatters configured.
      ['_'] = { 'trim_whitespace' },
    },
  },
  init = function()
    -- Ensure all formatters referenced by conform have been installed by mason
    -- see: https://github.com/zapling/mason-conform.nvim?tab=readme-ov-file
    require('mason-conform').setup()
  end,
}
