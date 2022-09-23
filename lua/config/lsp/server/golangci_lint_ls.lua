return function(opts, register)
    register({
        capabilities = opts.capabilities,
        on_attach = function(client, bfnr)
            client.resolved_capabilities.document_formatting = false
            opts.on_attach(client, bfnr)
        end,
    })
end
