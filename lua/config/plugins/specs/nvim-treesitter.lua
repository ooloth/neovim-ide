-- Highlight, edit, and navigate code

-- DOCS: `:h nvim-treesitter`
-- DOCS: https://github.com/nvim-treesitter/nvim-treesitter
-- DOCS: https://www.lazyvim.org/plugins/treesitter
-- DOCS: https://neovim.io/doc/user/treesitter.html

return {
  'nvim-treesitter/nvim-treesitter',
  version = false, -- last release is way too old and doesn't work on Windows
  build = ':TSUpdate',
  event = 'VeryLazy',
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
  keys = {
    { '<cr>', desc = 'Increment Selection' },
    { '<bs>', desc = 'Decrement Selection', mode = 'x' },
  },
  opts_extend = { 'ensure_installed' },
  opts = {
    auto_install = true, -- install missing parsers when entering buffer
    -- see: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
    -- NOTE: must install parsers that ship with nvim to override them and avoid errors
    -- https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position
    ensure_installed = {
      'query', -- treesitter query language
      'regex',
    },
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    incremental_selection = {
      -- see: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#incremental-selection
      keymaps = {
        init_selection = '<cr>',
        node_incremental = '<cr>',
        scope_incremental = false,
        node_decremental = '<bs>',
      },
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer', [']a'] = '@parameter.inner' },
        goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer', [']A'] = '@parameter.inner' },
        goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer', ['[a'] = '@parameter.inner' },
        goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer', ['[A'] = '@parameter.inner' },
      },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
  -- config = function(_, opts)
  --   require('nvim-treesitter.configs').setup(opts)
  -- end,
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which no longer trigger the **nvim-treesitter** module to be loaded in time.
    -- Luckily, the only things that those plugins need are the custom queries, which we make available during startup.
    -- see: https://www.lazyvim.org/plugins/treesitter#nvim-treesitter
    require('lazy.core.loader').add_to_rtp(plugin)
    require 'nvim-treesitter.query_predicates'
  end,
}
