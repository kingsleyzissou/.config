local formatter = require('formatter')

formatter.setup({
    filetype = {
        toml = { require('formatter.filetypes.toml').taplo },
        yaml = { require('formatter.filetypes.yaml').prettierd },
        ['*'] = { require('formatter.filetypes.any').remove_trailing_whitespace },
    },
})
