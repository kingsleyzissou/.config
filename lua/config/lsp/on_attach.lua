local function keymap(bufnr, lhs, rhs, opts)
    opts = opts or { buffer = bufnr, remap = false }
    vim.keymap.set('n', lhs, rhs, opts)
end

local function lsp_keymaps(bufnr)
    keymap(bufnr, 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    keymap(bufnr, 'gd', '<cmd>Telescope lsp_definitions<CR>')
    keymap(bufnr, 'gD', '<cmd>Telescope lsp_declarations<CR>')
    keymap(bufnr, 'gI', '<cmd>Telescope lsp_implementations<CR>')
    keymap(bufnr, 'gr', '<cmd>Telescope lsp_references<CR>')
    keymap(bufnr, 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>')
    keymap(bufnr, 'gl', '<cmd>lua vim.lsp.diagnostic.open_float()<CR>')
    keymap(bufnr, 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
end

local function lsp_highlight_document(client)
    if client.server_capabilities.document_highlight then
        local illuminate = require('illuminate')
        illuminate.on_attach(client)
    end
end

local function lsp_format_on_save(client)
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd([[
             augroup LspFormatting
                 autocmd! * <buffer>
                 autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
             augroup END
         ]])
    end
end

return function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_format_on_save(client)
    lsp_highlight_document(client)
end
