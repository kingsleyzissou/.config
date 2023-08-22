return {
  -- base plugins
  require('plugins.config.core'),

  -- telescope
  require('plugins.config.telescope'),

  -- autocomplete
  require('plugins.config.autocomplete'),

  -- lsp
  require('plugins.config.lsp'),

  -- color schemes & appearance
  require('plugins.config.appearance'),

  -- diagnostics a.k.a trouble
  require('plugins.config.diagnostics'),

  -- git
  require('plugins.config.git'),

  -- syntax highlighting
  require('plugins.config.syntax'),

  -- file explorer
  require('plugins.config.explorer'),

  -- tooling
  require('plugins.config.tooling'),

  -- session
  require('plugins.config.session'),

  -- terminal
  require('plugins.config.terminal'),

  -- testing
  require('plugins.config.test'),

  -- utilities - load this last and load which-key last
  require('plugins.config.utilities'),
}
