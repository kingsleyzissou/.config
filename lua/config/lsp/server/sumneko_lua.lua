return function(opts)
    return {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { 'use', 'vim' },
                },
                completion = {
                    callSnippet = 'Replace',
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                },
                telemetry = {
                    enable = false,
                },
                format = {
                    enabled = false,
                },
            },
        },
        capabilities = opts.capabilities,
        on_attach = opts.on_attach,
    }
end
