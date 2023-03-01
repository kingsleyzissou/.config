return function(opts)
  return {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'use', 'vim' },
        },
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
    capabilities = opts.capabilities,
    on_attach = opts.on_attach,
  }
end
