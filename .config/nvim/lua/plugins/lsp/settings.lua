local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { 'markdown', 'plaintext' },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  },
}

local function keymap(bufnr, lhs, rhs, description, opts)
  opts = opts or { buffer = bufnr, remap = false, desc = description }
  vim.keymap.set('n', lhs, rhs, opts)
end

M.on_attach = function(client, buffer)
  require('lsp-format').on_attach(client)
  -- require('illuminate').on_attach(client)

  keymap(buffer, '<leader>fd', '<cmd>Telescope lsp_definitions<cr>', 'Find definition')
  keymap(buffer, '<leader>fD', '<cmd>Telescope lsp_declarations<cr>', 'Find declaration')
  keymap(buffer, '<leader>fI', '<cmd>Telescope lsp_implementations<cr>', 'Find implementation')
  keymap(buffer, '<leader>fr', '<cmd>Telescope lsp_references<cr>', 'Find references')

  -- off by default
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  if client.name == 'null-ls' then
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
    vim.cmd([[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
      augroup END
    ]])
  end
end

return M
