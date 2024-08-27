-- see: https://github.com/echasnovski/mini.nvim/blob/main/doc/mini-files.txt#L444-L446
local hide_junk = function(fs_entry)
  return not vim.startswith(fs_entry.name, '.DS_Store')
end

return {
  'echasnovski/mini.files',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  version = '*',
  keys = {
    {
      '-',
      function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = 'Open file explorer (mini.files)',
    },
  },
  opts = {
    -- see: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-files.md#default-config

    -- Customization of shown content
    content = {
      filter = hide_junk, -- predicate for which file system entries to show
      prefix = nil, -- what prefix to show to the left of file system entry
      sort = nil, -- in which order to show file system entries
    },

    -- Use `''` (empty string) to not create one.
    mappings = {
      close = '<esc>',
      go_in = '',
      go_in_plus = 'l', -- close mini.files when opening a file
      go_out = 'h',
      go_out_plus = 'H',
      reset = '<BS>',
      show_help = '?',
      synchronize = '<cr>',
      -- synchronize = '=',
      trim_left = '<',
      trim_right = '>',
    },

    -- General options
    options = {
      permanent_delete = true, -- whether to delete permanently or move into module-specific trash
      use_as_default_explorer = true, -- whether to use for editing directories
    },

    windows = {
      max_number = 2, -- Maximum number of windows to show side by side
      preview = true,
      width_focus = 40,
      -- width_nofocus = 35,
      width_preview = 100,
    },
  },
}
