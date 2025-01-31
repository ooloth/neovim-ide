return {
  'folke/snacks.nvim',
  opts = {
    lazygit = {
      -- see: https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md
      config = {
        os = { editPreset = 'nvim-remote' },
        gui = {
          nerdFontsVersion = '', -- set to an empty string "" to disable icons
        },
      },
    },
    picker = {
      -- see: https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
      layouts = {
        default = {
          layout = {
            height = 0.99,
            width = 0.99,
          },
        },
      },
    },
    terminal = {
      win = {
        -- see: https://github.com/folke/snacks.nvim/blob/main/docs/win.md
        height = 0.99999999999999,
        width = 0.99999999999999,
      },
    },
  },
}
