return {
  'folke/snacks.nvim',
  opts = {
    lazygit = {
      -- see: https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md
      config = {
        gui = {
          nerdFontsVersion = '', -- set to an empty string "" to disable icons
        },
      },
      win = {
        -- see: https://github.com/folke/snacks.nvim/blob/main/docs/win.md
        height = 0,
        width = 0,
      },
    },
  },
  keys = {
    -- stylua: ignore start
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gh", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    -- stylua: ignore end
  },
}
