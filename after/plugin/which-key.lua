local whichkey = require('which-key')

whichkey.setup({
    plugins = {},
    key_labels = {
        ['<leader>'] = 'SPC',
    },
    popup_mappings = {
        scroll_down = '<C-j>',
        scroll_up = '<C-k>',
    },
    window = {
        border = 'single',
        position = 'bottom',
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    hidden = { '<leader>w' },
})

whichkey.register({
    f = { name = 'Finder' },
    g = { name = 'Git' },
    p = { name = 'Packer' },
    l = { name = 'Lsp' },
    t = { name = 'Terminal' },
    x = { name = 'Trouble' },
    s = { name = 'Session' },
    ['w'] = 'which_key_ignore',
    ['q'] = 'which_key_ignore',
}, { prefix = '<leader>' })
