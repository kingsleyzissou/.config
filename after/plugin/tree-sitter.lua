local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
    ensure_installed = { 'http', 'json', 'go', 'python', 'yaml' },
    auto_install = true,
})
