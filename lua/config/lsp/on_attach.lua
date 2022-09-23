local function keymap(bufnr, lhs, rhs, opts)
    opts = opts or { silent = true, noremap = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, opts)
end

local function lsp_keymaps(bufnr)
    keymap(bufnr, 'gd', '<cmd> Telescope lsp_definitions<CR>')
    keymap(bufnr, 'gD', '<cmd>Telescope lsp_declarations<CR>')
    keymap(bufnr, 'gI', '<cmd>Telescope lsp_implementations<CR>')
    keymap(bufnr, 'gr', '<cmd>Telescope lsp_references<CR>')
    keymap(bufnr, 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
    keymap(bufnr, 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    keymap(bufnr, '<C-a>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
end

local function lsp_highlight_document(client)
    if client.server_capabilities.document_highlight then
        local illuminate = require('illuminate')
        illuminate.on_attach(client)
    end
end

return function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end
