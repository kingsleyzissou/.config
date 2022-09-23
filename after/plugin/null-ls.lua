local null_ls = require('null-ls')

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local function on_attach(client)
    if client.resolved_capabilities.document_formatting then
        vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]])
    end
end

null_ls.setup({
    debug = false,
    sources = {
        -- code actions
        code_actions.shellcheck,
        code_actions.gitsigns,
        code_actions.eslint_d,
        -- diagnostics
        -- TODO: check spelling actions
        -- diagnostics.cspell,
        diagnostics.eslint_d,
        diagnostics.jsonlint,
        diagnostics.shellcheck.with({
            extra_args = {
                '-e',
                'SC1091',
                '-e',
                'SC2002',
            },
        }),
        -- formatting
        formatting.autopep8,
        formatting.prettier.with({
            filetypes = { 'toml', 'yaml' },
        }),
        formatting.prettier_d_slim.with({
            disabled_filetypes = { 'yaml' },
            extra_args = {
                '--single-quote',
                '--jsx-single-quote',
            },
        }),
        formatting.gofmt,
        formatting.goimports,
        formatting.jq,
        formatting.stylua,
        -- formatting.shfmt,
    },
    on_attach = on_attach,
})
