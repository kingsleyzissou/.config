return function(opts, register)
    register({
        yaml = {
            format = {
                singleQuote = false,
            },
            schemas = {
                ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
            },
            schemaStore = {
                enable = true,
            },
        },
        capabilities = opts.capabilities,
        on_attach = function(client, bfnr)
            -- client.resolved_capabilities.document_formatting = false
            opts.on_attach(client, bfnr)
        end,
    })
end
