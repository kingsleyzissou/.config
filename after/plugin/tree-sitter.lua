local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  ensure_installed = { 'http', 'json', 'lua', 'go', 'python', 'toml', 'yaml' },
  auto_install = true,
})
