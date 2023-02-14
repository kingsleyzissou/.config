return function(opts)
  return {
    settings = {
      gopls = {
        analyses = {
          simplifycompositelit = false,
        },
      },
    },
    capabilities = opts.capabilities,
    on_attach = opts.on_attach,
  }
end
