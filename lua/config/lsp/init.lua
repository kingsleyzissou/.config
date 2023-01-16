local lspconfig = require('lspconfig')
local mason = require('mason-lspconfig')
local on_attach = require('config.lsp.on_attach')
local capabilities = require('config.lsp.capabilities')
local close_tree = require('utilities.close_tree')

-- stuff I don't understand
require('neodev').setup()

-- setup mason
require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
  'golangci_lint_ls',
  'gopls',
  'jedi_language_server',
  'null-ls',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
  'yamlls',
}

local ensure_installed = {}

local function configure(server_name, options)
  if server_name == 'null-ls' then
    require('null-ls').setup(options)
    return
  end
  table.insert(ensure_installed, server_name)
  lspconfig[server_name].setup(options)
end

for _, server_name in pairs(servers) do
  local path = 'config.lsp.server.' .. server_name
  local ok, settings = pcall(require, path)
  if not ok then
    local notify = require('notify')
    notify('Error setting up lsp server: ' .. server_name, 'error')
    return
  end

  -- use a callback to configure the lsp server
  configure(
    server_name,
    settings({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  )
end

-- ensure that the lsp servers are installed
-- remove null-ls as this behaves differently
-- to the other servers
mason.setup({ ensure_installed = ensure_installed })

-- set key remaps
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover' })
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>lp', vim.diagnostic.open_float, { desc = 'View diagnostics' })
vim.keymap.set('n', '<leader>ll', vim.lsp.codelens.run, { desc = 'Codelens' })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Format' })
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next, { desc = 'Next item' })
vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev, { desc = 'Previous item' })
vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<cr>', { desc = 'Lsp info' })
vim.keymap.set('n', '<leader>lI', '<cmd>LspInstallInfo<cr>', { desc = 'Lsp install info' })
vim.keymap.set('n', '<leader>lo', '<cmd>SymbolsOutline<cr>', { desc = 'Symbol outlines' })
vim.keymap.set('n', '<leader>ls', close_tree('lsp_document_symbols'), { desc = 'Document symbols' })
vim.keymap.set('n', '<leader>lS', close_tree('lsp_dynamic_workspace_symbols'), { desc = 'Workspace symbols' })
