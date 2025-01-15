return {
  -- go
  golangci_lint_ls = {},
  gopls = require('plugins.lsp.servers.gopls'),

  -- python
  jedi_language_server = {},

  -- lua
  lua_ls = require('plugins.lsp.servers.lua_ls'),

  -- typescript/javascript
  ts_ls = {},
  -- eslint = {},

  -- rust
  rust_analyzer = {},

  -- other
  cssls = {},
  jsonls = {},
  -- yamlls = {},
}
