local signs = require('gitsigns')

local function blame_line()
    return function()
        signs.blame_line({ full = true })
    end
end

local function toggle_blame()
    return signs.toggle_current_line_blame()
end

local function diffthis()
    return function()
        signs.diffthis('~')
    end
end
-- keybindings
local map = vim.keymap.set
map('n', '<leader>gj', signs.next_hunk, { desc = 'Next hunk' })
map('n', '<leader>gk', signs.prev_hunk, { desc = 'Previous hunk' })
map('n', '<leader>gp', signs.preview_hunk, { desc = 'Preview hunk' })
map('n', '<leader>gr', signs.reset_hunk, { desc = 'Reset hunk' })
map('n', '<leader>gR', signs.reset_buffer, { desc = 'Reset buffer' })
map('n', '<leader>gs', signs.stage_hunk, { desc = 'Stage hunk' })
map('n', '<leader>gu', signs.undo_stage_hunk, { desc = 'Undo stage hunk' })
map('n', '<leader>gx', signs.toggle_deleted, { desc = 'Toggle deleted' })
map('n', '<leader>gb', blame_line, { desc = 'Blame line' })
map('n', '<leader>gB', toggle_blame, { desc = 'Toggle blame line' })
map('n', '<leader>gd', signs.diffthis, { desc = 'Diff this' })
map('n', '<leader>gD', diffthis, { desc = 'Diff this' })

signs.setup({
    preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
    },
})
