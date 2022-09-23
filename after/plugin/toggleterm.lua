local term = require('toggleterm')

term.setup({
    size = 20,
    hide_numbers = true,
    open_mapping = [[<C-\>]],
    shade_filetypes = {},
    shade_terminals = false,
    shading_factor = 0.3,
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal',
})

-- key bindings
local map = vim.keymap.set
map('n', '<leader>t1', '<cmd>1ToggleTerm<cr>', { desc = 'Terminal 1' })
map('n', '<leader>t2', '<cmd>2ToggleTerm<cr>', { desc = 'Terminal 2' })
map('n', '<leader>t3', '<cmd>3ToggleTerm<cr>', { desc = 'Terminal 3' })
map('n', '<leader>t4', '<cmd>4ToggleTerm<cr>', { desc = 'Terminal 4' })
map(
    'n',
    '<leader>tf',
    '<cmd>ToggleTerm direction=float<cr>',
    { desc = 'Float' }
)
map(
    'n',
    '<leader>th',
    '<cmd>ToggleTerm size=10 direction=horizontal<cr>',
    { desc = 'Horizontal' }
)
map(
    'n',
    '<leader>tv',
    '<cmd>ToggleTerm size=80 direction=vertical<cr>',
    { desc = 'Vertical' }
)
