local telescope = require('telescope')
local actions = require('telescope.actions')
local close_tree = require('utilities.close_tree')

-- fuzzy finder should ignore certain folders
telescope.setup({
    defaults = {
        file_ignore_patterns = {
            -- '.git/',
            -- 'build/',
            'target/',
            'docs/',
            'vendor/*',
            '%.lock',
            '__pycache__/*',
            '%.sqlite3',
            '%.ipynb',
            'node_modules/*',
            '%.svg',
            '%.otf',
            '%.ttf',
            '%.webp',
            '.dart_tool/',
            '.github/',
            '.gradle/',
            '.idea/',
            '.settings/',
            '.vscode/',
            '__pycache__/',
            'env/',
            'gradle/',
            'node_modules/',
            '%.pdb',
            '%.dll',
            '%.class',
            '%.exe',
            '%.cache',
            '%.ico',
            '%.pdf',
            '%.dylib',
            '%.jar',
            '%.docx',
            '%.met',
            'smalljre_*/*',
            '.vale/',
            '%.burp',
            '%.mp4',
            '%.mkv',
            '%.rar',
            '%.zip',
            '%.7z',
            '%.tar',
            '%.bz2',
            '%.epub',
            '%.flac',
            '%.tar.gz',
        },
        mappings = {
            i = {
                ['<c-j>'] = actions.move_selection_next,
                ['<c-k>'] = actions.move_selection_previous,
                ['<c-n>'] = actions.cycle_history_next,
                ['<c-p>'] = actions.cycle_history_prev,
                ['<c-d>'] = actions.delete_buffer,
            },
            n = {
                ['<c-d>'] = actions.delete_buffer,
            },
        },
    },
})

-- extensions
telescope.load_extension('frecency')
telescope.load_extension('projects')
telescope.load_extension('session-lens')

-- keybindings
local map = vim.keymap.set
map('n', '<leader>ff', close_tree('find_files'), { desc = 'Find files' })
map('n', '<leader>fe', close_tree('symbols'), { desc = 'Find emoji' })
map('n', '<leader>ft', close_tree('live_grep'), { desc = 'Find text' })
map('n', '<leader>fs', close_tree('grep_string'), { desc = 'Find string' })
map('n', '<leader>fm', close_tree('man_pages'), { desc = 'Find man pages' })
map('n', '<leader>fk', close_tree('keymaps'), { desc = 'Find keymaps' })
map('n', '<leader>fr', close_tree('oldfiles'), { desc = 'Find recent' })
map('n', '<leader>fT', '<cmd>NvimTreeClose | TodoTelescope<cr>', { desc = 'Find todos' })
map('n', '<leader>fb', '<cmd>NvimTreeClose | BrowseBookmarks<cr>', { desc = 'Find bookmark' })
map('n', '<leader>fw', '<cmd>NvimTreeClose | BrowseInputSearch<cr>', { desc = 'Find online' })
map('n', '<leader>fp', '<cmd>NvimTreeClose | Telescope projects<cr>', { desc = 'Find projects' })
