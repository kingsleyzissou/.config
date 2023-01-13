local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
    'eslint',
    'sumneko_lua',
    'gopls',
    'golangci_lint_ls',
    'jedi_language_server',
})

lsp.set_preferences({
    sign_icons = {
        error = '🙀',
        warn = '😿',
        hint = '😾',
        info = '😺',
    }
})

lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'use', 'vim' },
            },
            format = {
                enable = false,
            },

            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = function(_, bufnr)
        print("sumneko_lua: ", bufnr)
    end
})

local function keymap(bufnr, lhs, rhs, opts)
    opts = opts or { buffer = bufnr, remap = false }
    vim.keymap.set('n', lhs, rhs, opts)
end

local function lsp_keymaps(bufnr)
    keymap(bufnr, 'gd', '<cmd> Telescope lsp_definitions<CR>')
    keymap(bufnr, 'gD', '<cmd>Telescope lsp_declarations<CR>')
    keymap(bufnr, 'gI', '<cmd>Telescope lsp_implementations<CR>')
    keymap(bufnr, 'gr', '<cmd>Telescope lsp_references<CR>')
    keymap(bufnr, 'gR', function() vim.lsp.buf.rename() end)
    keymap(bufnr, 'gl', function() vim.diagnostic.open_float() end)
    keymap(bufnr, 'gs', function() vim.lsp.buf.signature_help() end)
    -- keymap(bufnr, 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    keymap(bufnr, '<C-a>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
end

local function lsp_highlight_document(client)
    if client.server_capabilities.document_highlight then
        local illuminate = require('illuminate')
        illuminate.on_attach(client)
    end
end

lsp.on_attach(function(client, bufnr)
    if client.server_capabilities.document_formatting then
        vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
            augroup END
        ]])
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end)

lsp.setup()
