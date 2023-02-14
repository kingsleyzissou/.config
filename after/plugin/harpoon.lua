local telescope = require('telescope')
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

-- -- use telescope for harpoon marks
telescope.load_extension('harpoon')

local map = vim.keymap.set
map('n', '<leader>ma', mark.add_file, { desc = 'Add mark' })
map('n', '<leader>m.', ui.nav_next, { desc = 'Next mark' })
map('n', '<leader>m,', ui.nav_prev, { desc = 'Previous mark' })
map('n', '<leader>mm', ui.toggle_quick_menu, { desc = 'View marks' })
map('n', '<leader>mb', '<cmd>TelescopeBuffers<cr>', { desc = 'View buffers' })

local navigate = function(id)
  return function()
    ui.nav_file(id)
  end
end
-- navigate to marks
map('n', '<leader>m1', navigate(1), { desc = 'Navigate to mark 1' })
map('n', '<leader>m2', navigate(2), { desc = 'Navigate to mark 2' })
map('n', '<leader>m3', navigate(3), { desc = 'Navigate to mark 3' })
map('n', '<leader>m4', navigate(4), { desc = 'Navigate to mark 4' })

-- register custom commands
vim.cmd([[
    command! TelescopeMarks lua require('utilities.dropdown').marks()
    command! TelescopeBuffers lua require('utilities.dropdown').buffers()
]])
