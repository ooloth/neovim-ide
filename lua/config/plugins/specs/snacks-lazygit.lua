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
  },
}
