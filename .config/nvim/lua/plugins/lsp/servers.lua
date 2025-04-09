local servers = {
  -- lua
  ['lua_ls'] = {
    Lua = {
      diagnostics = {
        globals = { 'use', 'vim' },
      },
      completion = {
        callSnippet = 'Replace',
      },
      Workspace = {
        checkThirdParty = false,
        maxPreload = 10000,
        preloadFileSize = 10000,
      },
    },
  },

  -- typescript/javascript
  ['vtsls'] = {},

  -- other
  ['cssls'] = {},
  ['jsonls'] = {},
  ['yamlls'] = {},
}

if os.getenv('CONTAINER_ID') ~= nil then
  servers['jedi_language_server'] = {}
  servers['golangci_lint_ls'] = {
    filetypes = { 'go', 'gomod' },
  }
  servers['gopls'] = {
    analyses = {
      simplifycompositelit = false,
    },
  }
end

return servers
