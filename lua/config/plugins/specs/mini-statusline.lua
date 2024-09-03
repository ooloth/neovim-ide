-- TODO: show active virtual env when in a python file (and a warning if no venv is active)

local lsp_attached_servers = function()
  local attached_servers = vim.lsp.get_clients()
  local server_names = ''
  local separator = ''

  for i, v in ipairs(attached_servers) do
    if i > 1 then
      separator = ', '
    end
    server_names = server_names .. separator .. v.name
  end

  return server_names
end

return {
  'echasnovski/mini.statusline',
  opts = {
    content = {
      active = function()
        -- see: `:h MiniStatusline-example-content`
        -- see: https://github.com/echasnovski/mini.statusline/blob/main/lua/mini/statusline.lua#L606-L631
        local statusline = require 'mini.statusline'

        local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
        local diagnostics = statusline.section_diagnostics { trunc_width = 75 }
        local filename = statusline.section_filename { trunc_width = 999 } -- always truncate to the relative path
        local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 999 } -- always truncate to just the filetype + icon
        local location = '%2l:%-2v' -- LINE:COLUMN
        local lsp = lsp_attached_servers()
        local search = statusline.section_searchcount { trunc_width = 75 }

        local mocha = require 'catppuccin.palettes.mocha'
        vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo', { bg = mocha.surface0 })

        return statusline.combine_groups {
          { hl = mode_hl, strings = { mode } },
          '%<', -- Mark general truncate point
          { hl = 'MiniStatuslineFilename', strings = { filename } },
          '%=', -- End left alignment
          { hl = 'MiniStatuslineDevinfo', strings = { diagnostics, lsp } },
          { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
          { hl = mode_hl, strings = { search, location } },
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
