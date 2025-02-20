vim.g.markdown_fenced_languages = {
  'ts=typescript',
}

local is_deno_project = function()
  local handle = io.popen('ls')
  if not handle then return false end

  local result = handle:read('*a')
  handle:close()

  local file1 = 'deno.json'
  local file2 = 'deno.lock'

  if result:find(file1) or result:find(file2) then return true end

  return false
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'javascript', 'jsdoc', 'typescript', 'tsx' },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#denols
        denols = {
          root_dir = function() require('lspconfig.util').root_pattern('deno.json', 'deno.jsonc', 'deno.lock') end,
          settings = {
            deno = {
              -- FIXME: only if there's a deno.json?
              -- see: https://docs.deno.com/runtime/getting_started/setup_your_environment/#neovim-0.6%2B-using-the-built-in-language-server
              enable = true, -- TODO: unblock when I can get it to only apply to deno projects
              -- enable = is_deno_project(),
              suggest = {
                imports = {
                  hosts = {
                    ['https://deno.land'] = true,
                  },
                },
              },
            },
          },
          setup = {
            deno_ls = function()
              local nvim_lsp = require('nvim_lsp')
              nvim_lsp.deno_ls.setup({
                root_dir = nvim_lsp.util.root_pattern('deno.json', 'deno.lock'),
              })
              -- require('lazyvim.util').lsp.on_attach(function(client, _) -- FIXME: remove lazyvim import?
              --   if client.name == 'deno_ls' then
              --     client.config.enabled = is_deno_project()
              --   end
              -- end)
            end,
          },
        },
      },
    },
  },

  -- {
  --   'stevearc/conform.nvim',
  --   opts = {
  --     formatters_by_ft = {
  --       markdown = { 'inject', 'prettier' },
  --       ['markdown.mdx'] = { 'prettier' },
  --     },
  --   },
  -- },
}
