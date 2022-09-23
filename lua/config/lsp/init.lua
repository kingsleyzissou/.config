local on_attach = require('config.lsp.on_attach')
local capabilities = require('config.lsp.capabilities')
local close_tree = require('utilities.close_tree')

-- TODO: yaml diagnostics
local servers = {
    'golangci_lint_ls',
    'gopls',
    'jedi_language_server',
    'sumneko_lua',
    -- 'yamlls',
}

local function register(server)
    return function(options)
        require('lspconfig')[server].setup(options)
    end
end

for _, server in pairs(servers) do
    local path = 'config.lsp.server.' .. server
    local ok, lsp = pcall(require, path)
    if not ok then
        local notify = require('notify')
        notify('Error setting up lsp server: ' .. server, 'error')
        return
    end

    local opts = {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- use a callback to register the lsp server
    lsp(opts, register(server))
end

-- keybindings
local map = vim.keymap.set
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code action' })
map('n', '<leader>lp', vim.diagnostic.open_float, { desc = 'View diagnostics' })
map('n', '<leader>ll', vim.lsp.codelens.run, { desc = 'Codelens' })
map('n', '<leader>lf', vim.lsp.buf.formatting_sync, { desc = 'Format' })
map('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename' })
map('n', '<leader>lj', vim.diagnostic.goto_next, { desc = 'Next item' })
map('n', '<leader>lk', vim.diagnostic.goto_prev, { desc = 'Previous item' })
map('n', '<leader>li', '<cmd>LspInfo<cr>', { desc = 'Lsp info' })
map('n', '<leader>lI', '<cmd>LspInstallInfo<cr>', { desc = 'Lsp install info' })
map('n', '<leader>lo', '<cmd>SymbolsOutline<cr>', { desc = 'Symbol outlines' })
map('n', '<leader>ls', close_tree('lsp_document_symbols'), { desc = 'Document symbols' })
map('n', '<leader>lS', close_tree('lsp_dynamic_workspace_symbols'), { desc = 'Workspace symbols' })
