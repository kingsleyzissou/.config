local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local function keymap(bufnr, lhs, rhs, description, opts)
  opts = opts or { buffer = bufnr, remap = false, desc = description }
  vim.keymap.set('n', lhs, rhs, opts)
end

M.on_attach = function(client, buffer)
  keymap(buffer, '<leader>fd', '<cmd>Telescope lsp_definitions<cr>', 'Find definition')
  keymap(buffer, '<leader>fD', '<cmd>Telescope lsp_declarations<cr>', 'Find declaration')
  keymap(buffer, '<leader>fi', '<cmd>Telescope lsp_implementations<cr>', 'Find implementation')
  keymap(buffer, '<leader>fr', '<cmd>Telescope lsp_references<cr>', 'Find references')

  -- off by default
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
  client.capabilities.textDocument.formatting = false
end

return M
