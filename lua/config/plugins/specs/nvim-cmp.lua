-- TODO: what if I want to move to the next line with CR while there are irrelevant options showing and I don't want to leave insert mode with ESC?
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
    'folke/lazydev.nvim',
  },
  config = function()
    local cmp = require 'cmp'

    cmp.setup {
      completion = { completeopt = 'menu,menuone,noinsert' },
      snippet = {
        expand = function(args)
          -- see: https://github.com/garymjr/nvim-snippets/issues/7#issuecomment-2137168610
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- scroll preview window down
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- scroll preview window up
        ['<C-s>'] = cmp.mapping.complete {}, -- show completion suggestions (if they didn't automatically appear)
        ['<C-e>'] = cmp.mapping.abort(),

        -- This will auto-import if your LSP supports it.
        -- This will expand snippets if the LSP sent a snippet.
        ['<CR>'] = cmp.mapping.confirm { select = true },
      },
      sources = {
        {
          name = 'lazydev',
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions as lazydev recommends
        },
        { name = 'nvim_lsp' },
        { name = 'snippets' }, -- nvim-snippets
        { name = 'path' },
      },
    }
  end,
}
