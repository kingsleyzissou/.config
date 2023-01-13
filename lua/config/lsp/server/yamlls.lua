return function(opts)
    return {
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
        on_attach = opts.on_attach,
    }
end
