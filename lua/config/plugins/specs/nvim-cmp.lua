-- TODO: https://www.lazyvim.org/plugins/coding#nvim-cmp
-- TODO: https://www.lazyvim.org/plugins/coding#cmp-nvim-lsp
-- TODO: https://www.lazyvim.org/plugins/coding#cmp-buffer
-- TODO: https://www.lazyvim.org/plugins/coding#cmp-path

-- Autocompletion
-- See `:help cmp`

return {
  'hrsh7th/nvim-cmp',
  version = false, -- last release is way too old
  event = 'InsertEnter',
  dependencies = {
    require 'config.plugins.specs.nvim-snippets',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-emoji',
    'folke/lazydev.nvim',
  },
  config = function()
    vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

    local cmp = require 'cmp'

    cmp.setup {
      completion = {
        -- TODO: remove "noselect" if I want to go back to the first item being automatically selected
        -- see: https://stackoverflow.com/a/74714258/8802485
        completeopt = 'menu,menuone,noinsert,noselect',
      },
      experimental = {
        ghost_text = {
          hl_group = 'CmpGhostText',
        },
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- scroll preview window down
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- scroll preview window up
        ['<C-s>'] = cmp.mapping.complete {}, -- show completion suggestions (if they didn't automatically appear)
        ['<C-e>'] = cmp.mapping.abort(),

        -- TODO: set select = true if I want to go back to CR always inserting an item (rather than allowing a newline)
        -- I could always consider C-y instead of CR to remove the issue of wanting CR to sometimes close the window
        -- This will auto-import if your LSP supports it.
        -- This will expand snippets if the LSP sent a snippet.
        ['<CR>'] = cmp.mapping.confirm { select = false },
      },
      snippet = {
        expand = function(args)
          -- see: https://github.com/garymjr/nvim-snippets/issues/7#issuecomment-2137168610
          vim.snippet.expand(args.body)
        end,
      },
      sources = {
        {
          name = 'lazydev',
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions as lazydev recommends
        },
        { name = 'nvim_lsp' },
        { name = 'snippets' }, -- nvim-snippets
        { name = 'path' },
        { name = 'emoji', option = { insert = true } },
      },
    }
  end,
}
