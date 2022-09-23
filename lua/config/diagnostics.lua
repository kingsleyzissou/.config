local signs = {
    { name = 'DiagnosticSignError', text = '🙀' },
    { name = 'DiagnosticSignWarn', text = '😿' },
    { name = 'DiagnosticSignHint', text = '😾' },
    { name = 'DiagnosticSignInfo', text = '😺' },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text = sign.text,
        numhl = '',
    })
end

local config = {
    virtual_lines = true,
    virtual_text = true,
    signs = {
        active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        source = 'if_many', -- Or "always"
        header = '',
        prefix = '',
    },
}

vim.diagnostic.config(config)
