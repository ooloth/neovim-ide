-- TODO: try this - https://github.com/neovim/nvim-lspconfig/blob/master/test/minimal_init.lua
-- TODO: more ideas - https://github.com/ilias777/nvim/blob/1d0f2e122525869025c4fd6171d69a23020234e1/lua/plugins/lsp/lsp-config.lua

-- see: https://www.lazyvim.org/plugins/lsp

local set_lsp_keymaps = function(lsp_attach_event)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = lsp_attach_event.buf, desc = desc })
  end

  local builtin = require 'telescope.builtin'

  map('gd', builtin.lsp_definitions, 'Go to definition') -- jump to where the variable/function under the cursor was first created; to jump back, press <C-t>
  map('gD', vim.lsp.buf.declaration, 'Go to declaration') -- for example, in C this would take you to the header
  map('gr', builtin.lsp_references, 'Go to references') -- find references to the word under the cursor
  map('gI', builtin.lsp_implementations, 'Go to implementations') -- jump to an implementation of the word under your cursor; useful when your language has ways of declaring types without an actual implementation
  map('<leader>ss', builtin.lsp_document_symbols, 'Symbols in editor') -- fuzzy find all the symbols in your current document; symbols are things like variables, functions, types, etc.
  map('<leader>sS', builtin.lsp_dynamic_workspace_symbols, 'Symbols in project') -- fuzzy find all the symbols in your current workspace; similar to document symbols, except searches over your entire project
  map('<leader>st', builtin.lsp_type_definitions, 'type definition') -- jump to the type of the word under your cursor; useful when you're not sure what type a variable is and you want to see the definition of its *type*, not where it was *defined*
  map('<leader>rs', vim.lsp.buf.rename, 'Rename symbol') -- rename the variable under your cursor; most Language Servers support renaming across files, etc.
  map('<leader>ra', vim.lsp.buf.code_action, 'Code action', { 'n', 'x' }) -- execute a code action, usually your cursor needs to be on top of an error or a suggestion from your LSP for this to activate

  local client = vim.lsp.get_client_by_id(lsp_attach_event.data.client_id)

  -- Set keymap to toggle inlay hints if the language server supports them (this may be unwanted, since they displace some of your code)
  -- stylua: ignore
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    map('<leader>uh', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = lsp_attach_event.buf }) end, 'Toggle inlay hints')
  end
end

local highlight_references_to_cursor_word_in_editor = function(lsp_attach_event)
  local client = vim.lsp.get_client_by_id(lsp_attach_event.data.client_id)

  -- Highlight references to word under cursor
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
    local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = lsp_attach_event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.document_highlight,
    })

    -- Clear highlights when cursor moves
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = lsp_attach_event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.clear_references,
    })

    -- Clear highlights when lsp detaches
    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
      end,
    })
  end
end

local show_active_diagnostics_on_cursor_line = function()
  -- show line diagnostics in floating window while cursor is on line
  -- see: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
  vim.api.nvim_create_autocmd('CursorHold', {
    callback = function()
      vim.diagnostic.open_float(nil, { focusable = false })
    end,
  })
end

return {
  'neovim/nvim-lspconfig',
  event = { 'BufNewFile', 'BufRead', 'BufWritePre' },
  dependencies = {
    'williamboman/mason.nvim', -- so mason installations will be possible
    'williamboman/mason-lspconfig.nvim', -- so lspconfig + mason names will both work
    'WhoIsSethDaniel/mason-tool-installer.nvim', -- automatically install lsp servers I've configured
    'hrsh7th/cmp-nvim-lsp', -- extend nvim's default lsp capabilities
    'j-hui/fidget.nvim', -- show lsp updates via discrete UI in the bottom right
  },
  opts = {
    -- options for vim.diagnostic.config()
    ---@type vim.diagnostic.Opts
    diagnostics = {
      float = { border = 'rounded', source = true },
    },
  },
  config = function(_, opts)
    -- Enable behavior that should only exist while an LSP is attached
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        set_lsp_keymaps(event)
        highlight_references_to_cursor_word_in_editor(event)
        show_active_diagnostics_on_cursor_line()
      end,
    })

    -- Ensure all servers configured via nvim-lspconfig's "opts.servers" have been installed
    require('mason').setup()
    require('mason-tool-installer').setup {
      ensure_installed = vim.tbl_keys(opts.servers or {}),
    }

    -- Set up each server
    -- see: https://github.com/williamboman/mason-lspconfig.nvim/tree/main?tab=readme-ov-file#setup
    require('mason-lspconfig').setup()
    require('mason-lspconfig').setup_handlers {
      -- Define default handler for every server
      function(server_name)
        -- Grab any custom options set for this LSP in this repo
        local server = opts.servers[server_name] or {}

        -- Merge neovim's LSP capabilities + nvim-cmp's capabilities + any overrides I've defined for this server
        server.capabilities =
          vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities(), server.capabilities or {})

        -- Set up server
        require('lspconfig')[server_name].setup(server)
      end,
    }
  end,
}
