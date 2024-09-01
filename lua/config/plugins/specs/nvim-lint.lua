-- TODO: https://www.lazyvim.org/plugins/linting
-- see: https://github.com/mfussenegger/nvim-lint
-- see: https://www.lazyvim.org/plugins/linting#nvim-lint
-- see: https://github.com/mfussenegger/nvim-lint#available-linters

return {
  'mfussenegger/nvim-lint',
  event = { 'BufNewFile', 'BufRead', 'BufWritePre' },
  config = function()
    -- Create autocommand which carries out the actual linting
    -- see: https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#usage
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
