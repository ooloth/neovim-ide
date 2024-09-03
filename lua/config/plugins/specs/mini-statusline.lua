-- TODO: filename: remove cwd from left side of filename path
-- TODO: fileinfo: remove unwanted info
-- TODO: lsp: move to right side + show full server name instead of icon + remove "+" separator when 0-1 values
-- TODO: show active virtual env when in a python file (and a warning if no venv is active)

local empty = function()
  return ''
end

-- Set the section for cursor location to LINE:COLUMN
local line_colon_column = function()
  return '%2l:%-2v'
end

return {
  'echasnovski/mini.statusline',
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = true }

    statusline.section_diff = empty
    statusline.section_git = empty
    -- statusline.section_fileinfo = empty
    statusline.section_location = line_colon_column
  end,
}
