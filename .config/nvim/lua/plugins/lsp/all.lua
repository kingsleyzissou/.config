local function buf_keymap(bufnr, lhs, rhs, description, opts)
  opts = opts or { buffer = bufnr, remap = false, desc = description }
  vim.keymap.set('n', lhs, rhs, opts)
end

return {
  {
    'williamboman/mason.nvim',
    config = true,
  },

  {
    'folke/lazydev.nvim',
    ft = 'lua',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = true,
  },

  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },

  -- this needs to go last, hence the file name
  {
    'neovim/nvim-lspconfig',
    tag = 'v1.3.0',
    lazy = false,
    keys = {
      { '<leader>lp', vim.diagnostic.open_float, desc = 'View diagnostics' },
      { '<leader>la', vim.lsp.buf.code_action, desc = 'Code action' },
      { '<leader>ll', vim.lsp.codelens.run, desc = 'Codelens' },
      { '<leader>lr', vim.lsp.buf.rename, desc = 'Rename' },
      { '<leader>lj', vim.diagnostic.goto_next, desc = 'Next item' },
      { '<leader>lk', vim.diagnostic.goto_prev, desc = 'Previous item' },
      { '<leader>ls', vim.lsp.buf.signature_help, desc = 'Signature help' },
      { '<leader>li', '<cmd>LspInfo<cr>', desc = 'Lsp info' },
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, settings in pairs(opts.servers) do
        if server == 'vtsls' then
          local pretty = require('pretty-ts-errors')
          vim.keymap.set('n', '<leader>lp', pretty.show_formatted_error, { desc = 'View diagnostics' })
        end

        lspconfig[server].setup({
          capabilities = vim.lsp.protocol.make_client_capabilities(),
          settings = settings,
          on_attach = function(client, buffer)
            buf_keymap(buffer, '<leader>fd', '<cmd>Telescope lsp_definitions<cr>', 'Find definition')
            buf_keymap(buffer, '<leader>fD', '<cmd>Telescope lsp_declarations<cr>', 'Find declaration')
            buf_keymap(buffer, '<leader>fi', '<cmd>Telescope lsp_implementations<cr>', 'Find implementation')
            buf_keymap(buffer, '<leader>fr', '<cmd>Telescope lsp_references<cr>', 'Find references')

            -- we'll let conform handle the formatting
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            client.capabilities.textDocument.formatting = false
          end,
        })
      end
    end,
  },
}
