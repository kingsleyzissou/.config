local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
    ensure_installed = { 'http', 'json' },
    auto_install = true,
})
