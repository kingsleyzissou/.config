local tree = require('nvim-tree')

tree.setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    view = {
        side = 'left',
        signcolumn = 'yes',
        mappings = {
            list = {
                { key = 'u', action = 'dir_up' },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        debounce_delay = 10,
        icons = {
            hint = '😺',
            info = '😾',
            warning = '😿',
            error = '🙀',
        },
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    renderer = {
        highlight_opened_files = 'name',
        -- symbols from: https://github.com/iamcco/dotfiles
        icons = {
            glyphs = {
                default = ' ',
                symlink = ' ',
                folder = {
                    default = '',
                    open = '',
                },
                git = {
                    unstaged = '★',
                    staged = '✓',
                    untracked = '?',
                    renamed = '➜',
                    unmerged = '',
                    deleted = '⊟',
                },
            },
        },
    },
})

-- basic config
vim.g.lua_tree_width = '30'
vim.g.lua_tree_ignore = { '.git', 'node_modules', 'vendor' }

vim.cmd([[
    command! TreeToggle lua require('utilities.treefocus').toggle()
    command! TreeFocus lua require('utilities.treefocus').focus()
]])
