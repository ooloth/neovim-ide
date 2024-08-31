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
    { 'L3MON4D3/LuaSnip', version = '2.3.0', build = 'make install_jsregexp' },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    vim.luasnip.config.setup {}

    cmp.setup {
      completion = { completeopt = 'menu,menuone,noinsert' },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),

        -- This will auto-import if your LSP supports it.
        -- This will expand snippets if the LSP sent a snippet.
        ['<CR>'] = cmp.mapping.confirm { select = true },

        -- Manually trigger a completion from nvim-cmp.
        ['<C-s>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        {
          name = 'lazydev',
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions as lazydev recommends
        },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    }
  end,
}
