-- extend the options to add
-- globals for the diagnostics
return function(opts, register)
    register({
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
        capabilities = opts.capabilities,
        on_attach = function(client, bfnr)
            client.resolved_capabilities.document_formatting = false
            opts.on_attach(client, bfnr)
        end,
    })
end
