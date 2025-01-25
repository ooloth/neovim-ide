-- TODO: show attached formatters and linters as well
-- TODO: show @recording messages in statusline instead of notify pop-ups? https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages

local get_attached_lsp_servers = function()
  local current_buffer_servers = vim.lsp.get_clients { bufnr = vim.fn.bufnr '%' }
  local server_names = {}

  for _, value in ipairs(current_buffer_servers) do
    vim.list_extend(server_names, { value.name })
  end

  return table.concat(server_names, ', ')
end

local get_active_venv = function()
  if vim.bo.filetype ~= 'python' then
    return ''
  end

  if not vim.env.VIRTUAL_ENV then
    return '(no venv activated)'
  end

  -- TODO: need anymore with uv?
  -- example path (pyenv) = '/Users/michael/.pyenv/versions/3.12.1/envs/scraper'
  -- example path (rye) = '/Users/michael/Repos/ooloth/some-python-project/.venv'
  return '(' .. vim.fs.basename(vim.env.VIRTUAL_ENV) .. ')'
end

return {
  'echasnovski/mini.statusline',
  opts = {
    content = {
      active = function()
        -- see: `:h MiniStatusline-example-content`
        -- see: https://github.com/echasnovski/mini.statusline/blob/main/lua/mini/statusline.lua#L606-L631
        local statusline = require 'mini.statusline'

        -- Get strings to display
        local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
        local diagnostics = statusline.section_diagnostics { trunc_width = 75 }
        local filename = statusline.section_filename { trunc_width = 999 } -- always truncate to the relative path
        local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 999 } -- always truncate to just the filetype + icon
        local location = '%2l:%-2v' -- LINE:COLUMN
        local lsp = get_attached_lsp_servers()
        local search = statusline.section_searchcount { trunc_width = 75 }
        local venv = get_active_venv()

        -- Customize highlight group colors
        local mocha = require 'catppuccin.palettes.mocha'
        vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { bg = 'none' }) -- no middle bg color across statusline
        vim.api.nvim_set_hl(0, 'MiniStatuslineLspServers', { bg = mocha.surface0 })
        vim.api.nvim_set_hl(0, 'MiniStatuslineDiagnostics', { fg = mocha.yellow })

        -- Compose strings into one big statusline string
        return statusline.combine_groups {
          { hl = mode_hl, strings = { mode } },
          '%<', -- Mark general truncate point
          { hl = 'MiniStatuslineFilename', strings = { filename } },
          '%=', -- End left alignment
          { hl = mode_hl, strings = { search } },
          { hl = 'MiniStatuslineDiagnostics', strings = { diagnostics } },
          { hl = 'MiniStatuslineLspServers', strings = { lsp } },
          { hl = 'MiniStatuslineFileinfo', strings = { fileinfo, venv } },
          { hl = mode_hl, strings = { location } },
        }
      end,
      inactive = function()
        -- see: https://github.com/echasnovski/mini.statusline/blob/main/lua/mini/statusline.lua#L633C30-L633C83
        return '%#MiniStatuslineInactive#%f%=' -- show relative file path instead of absolute path
      end,
    },
    set_vim_settings = false, -- don't override laststatus option
    use_icons = true,
  },
}
