-- Highlight, edit, and navigate code

-- DOCS: `:h nvim-treesitter`
-- DOCS: https://github.com/nvim-treesitter/nvim-treesitter
-- DOCS: https://www.lazyvim.org/plugins/treesitter
-- DOCS: https://neovim.io/doc/user/treesitter.html

return {
  'nvim-treesitter/nvim-treesitter',
  version = false, -- last release is way too old and doesn't work on Windows
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  event = 'VeryLazy',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- sets main module to use for opts
  cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  keys = {
    { '<cr>', desc = 'Increment Selection' },
    { '<bs>', desc = 'Decrement Selection', mode = 'x' },
  },
  opts = {
    auto_install = true, -- install missing parsers when entering buffer
    -- see: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
    -- NOTE: must install parsers that ship with nvim to override them and avoid errors
    -- https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    ensure_installed = { 'query', 'regex' },
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
        -- see: https://github.com/nvim-treesitter/nvim-treesitter-textobjects?tab=readme-ov-file#text-objects-move
        enable = true,
        goto_next_start = {
          [']f'] = '@function.outer',
          -- [']c'] = '@class.outer',
          -- [']a'] = '@parameter.inner',
        },
        goto_next_end = {
          [']F'] = '@function.outer',
          -- [']C'] = '@class.outer',
          -- [']A'] = '@parameter.inner',
        },
        goto_previous_start = {
          ['[f'] = '@function.outer',
          -- ['[c'] = '@class.outer',
          -- ['[a'] = '@parameter.inner',
        },
        goto_previous_end = {
          ['[F'] = '@function.outer',
          -- ['[C'] = '@class.outer',
          -- ['[A'] = '@parameter.inner',
        },
      },
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = { query = '@function.outer', desc = 'Outer function' },
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          -- You can optionally set descriptions to the mappings (used in the desc parameter of
          -- nvim_buf_set_keymap) which plugins like which-key display
          ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
          -- You can also use captures from other query groups like `locals.scm`
          ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
        },
      },
    },
  },
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and its custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which no longer trigger the **nvim-treesitter** module to be loaded in time.
    -- Luckily, the only things that those plugins need are the custom queries, which we make available during startup.
    require('lazy.core.loader').add_to_rtp(plugin)
    require 'nvim-treesitter.query_predicates'
  end,
}
