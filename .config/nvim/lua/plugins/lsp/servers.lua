return {
  -- go
  golangci_lint_ls = {},
  gopls = {
    analyses = {
      simplifycompositelit = false,
    },
  },

  -- python
  jedi_language_server = {},

  -- lua
  lua_ls = {
    Lua = {
      diagnostics = {
        globals = { 'use', 'vim' },
      },
      completion = {
        callSnippet = 'Replace',
      },
      Workspace = {
        checkThirdParty = false,
      },
    },
  },

  -- typescript/javascript
  ts_ls = {},

  -- other
  cssls = {},
  jsonls = {},
  yamlls = {},
}
