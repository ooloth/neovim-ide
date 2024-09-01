return {
  'echasnovski/mini.nvim',
  config = function()
    -- Simple and easy statusline
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = true }

    -- You can configure sections in the statusline by overriding their default behavior
    -- For example, here we set the section for cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
