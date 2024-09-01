-- DOCS: https://github.com/folke/which-key.nvim
-- DOCS: https://www.lazyvim.org/plugins/editor#which-keynvim
-- TODO: distribute in relevant files with wk.add()?

return {
  'folke/which-key.nvim',
  opts = {
    -- see: https://www.lazyvim.org/plugins/editor#which-keynvim
    defaults = {},
    icons = { mappings = false },
    sort = { 'alphanum' },
    spec = {
      mode = { 'n', 'v' }, -- inherited by block of mappings below
      { '<leader><tab>', group = 'Tab' },
      { '<leader>d', group = 'Debug' },
      {
        '<leader>e',
        group = 'Editor',
        expand = function()
          return require('which-key.extras').expand.buf()
        end,
      },
      { '<leader>f', group = 'File' },
      { '<leader>g', group = 'Git', { '<leader>t', group = 'Toggle' } },
      { '<leader>i', group = 'Inspect' },
      { '<leader>o', group = 'Open' },
      { '<leader>q', group = 'Quit' },
      { '<leader>r', group = 'Refactor' },
      { '<leader>s', group = 'Search' },
      { '<leader>t', group = 'Test' },
      { '<leader>u', group = 'UI' },
      { '<leader>w', group = 'Window' },
      { '<leader>x', group = 'Diagnostics' },
      { ']', group = 'Next' },
      { '[', group = 'Previous' },
      { 'g', group = 'Go to' },
      -- { 'gz', group = 'Surround' },
      { 'z', group = 'fold' },
      {
        '<leader>w',
        group = 'windows',
        proxy = '<c-w>', -- proxy nvim window mappings
        expand = function()
          return require('which-key.extras').expand.win()
        end,
      },
      -- better descriptions for nvim's built-in keymaps
      { 'gx', desc = 'Open with system app' },
    },
  },
}
