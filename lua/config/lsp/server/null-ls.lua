local code_actions = require('null-ls').builtins.code_actions
local diagnostics = require('null-ls').builtins.diagnostics
local formatting = require('null-ls').builtins.formatting

return function(opts)
    return {
        debug = false,
        sources = {
            -- code actions
            code_actions.shellcheck,
            code_actions.gitsigns,
            code_actions.eslint_d,
            -- diagnostics
            -- TODO: check spelling actions
            -- diagnostics.cspell,
            diagnostics.eslint,
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
        },
        on_attach = opts.on_attach,
    }
end
