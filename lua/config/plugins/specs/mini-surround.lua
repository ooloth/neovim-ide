-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- Examples:
-- gsiw' - Surround word under cursor with ''
-- ds'   - Delete the surrounding ''
-- cs'`  - Change the surround '' to ``
--
-- DOCS: https://github.com/echasnovski/mini.surround
-- DOCS: https://www.lazyvim.org/extras/coding/mini-surround

return {
  'echasnovski/mini.surround',
  recommended = true,
  opts = {
    mappings = {
      add = 'gs', -- Add surrounding in Normal and Visual modes
      delete = 'ds', -- Delete surrounding
      replace = 'cs', -- Replace surrounding
      find = '', -- Find surrounding (to the right)
      find_left = '', -- Find surrounding (to the left)
      highlight = '', -- Highlight surrounding
      update_n_lines = '', -- Update `n_lines`
      suffix_last = '',
      suffix_next = '',
    },
  },
}
