local telescope = require('telescope')
local actions = require('telescope.actions')

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

-- keybindings
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fe', '<cmd>Telescope symbols<cr>', { desc = 'Find emoji' })
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope live_grep<cr>', { desc = 'Find text' })
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope grep_string<cr>', { desc = 'Find string' })
vim.keymap.set('n', '<leader>fm', '<cmd>Telescope man_pages<cr>', { desc = 'Find man pages' })
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Find keymaps' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Find recent' })
vim.keymap.set('n', '<leader>fT', '<cmd>TodoTelescope<cr>', { desc = 'Find todos' })
vim.keymap.set('n', '<leader>fb', '<cmd>BrowseBookmarks<cr>', { desc = 'Find bookmark' })
vim.keymap.set('n', '<leader>fw', '<cmd>BrowseInputSearch<cr>', { desc = 'Find online' })
vim.keymap.set('n', '<leader>fp', '<cmd>Telescope projects<cr>', { desc = 'Find projects' })
