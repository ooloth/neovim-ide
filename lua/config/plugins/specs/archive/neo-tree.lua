return {

  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = function() -- replace all default keys
      return {
        -- see: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua
        { '<leader>e', function() require('neo-tree.command').execute({ toggle = true, dir = vim.loop.cwd() }) end, desc = 'Explorer' },
      }
    end,
    opts = {
      event_handlers = {
        -- see: https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#auto-close-on-open-file
        {
          event = 'file_opened',
          handler = function()
            --auto close
            require('neo-tree').close_all()
          end,
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = { '.git' },
        },
      },
      window = {
        mappings = {
          ['<space>'] = 'none',
          ['.'] = 'none',
          ['h'] = 'close_node',
          ['l'] = 'open',
          ['s'] = 'open_split',
          ['v'] = 'open_vsplit',
        },
        width = 52,
      },
    },
  },
}
