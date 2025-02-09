-- TODO: https://www.lazyvim.org/plugins/linting

-- DOCS: https://github.com/mfussenegger/nvim-lint
-- DOCS: https://github.com/mfussenegger/nvim-lint#available-linters
-- DOCS: https://www.lazyvim.org/plugins/linting#nvim-lint

return {
  'mfussenegger/nvim-lint',
  event = { 'BufNewFile', 'BufRead', 'BufWritePre' },
  config = function()
    -- Disable unwanted default linters by filetype
    -- see: https://github.com/mfussenegger/nvim-lint/blob/debabca63c0905b59ce596a55a8e33eafdf66342/lua/lint.lua#L51
    -- see: https://github.com/mfussenegger/nvim-lint/issues/411#issuecomment-1763172506
    require('lint').linters_by_ft.markdown = {} -- disable vale
    require('lint').linters_by_ft.rst = {} -- disable vale
    require('lint').linters_by_ft.text = {} -- disable vale

    -- Create autocommand to trigger the actual linting
    -- see: https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#usage
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function() require('lint').try_lint() end,
    })
  end,
}
