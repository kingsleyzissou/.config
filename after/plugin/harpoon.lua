local telescope = require('telescope')

-- -- use telescope for harpoon marks
telescope.load_extension('harpoon')

local map = vim.keymap.set
map('n', 'mm', require('harpoon.mark').add_file, { desc = 'Add mark' })
map('n', 'm.', require('harpoon.ui').nav_next, { desc = 'Next mark' })
map('n', 'm,', require('harpoon.ui').nav_prev, { desc = 'Previous mark' })
map('n', 'ms', '<cmd>TelescopeMarks<cr>', { desc = 'View marks' })
map('n', 'mb', '<cmd>TelescopeBuffers<cr>', { desc = 'View buffers' })

-- register custom commands
vim.cmd([[
    command! TelescopeMarks lua require('utilities.dropdown').marks()
    command! TelescopeBuffers lua require('utilities.dropdown').buffers()
]])
