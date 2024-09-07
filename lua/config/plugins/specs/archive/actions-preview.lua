-- A code actions menu UI that includes a preview of the impact of the change

-- DOCS: https://github.com/aznhe21/actions-preview.nvim

return {
  'aznhe21/actions-preview.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    -- priority list of preferred backend
    backend = { 'nui', 'telescope' },
  },
}
