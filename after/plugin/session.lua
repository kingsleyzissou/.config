local autosession = require('auto-session')

autosession.setup({
    log_level = 'info',
    auto_session_suppress_dirs = { '~/', '~/Projects' },
})

-- keybindings
local map = vim.keymap.set
map('n', '<leader>ss', '<cmd>SaveSession<cr>', { desc = 'Save session' })
map('n', '<leader>sr', '<cmd>RestoreSession<cr>', { desc = 'Restore session' })
map('n', '<leader>sd', '<cmd>DeleteSession<cr>', { desc = 'Delete session' })
map('n', '<leader>sf', '<cmd>Telescope session-lens search_session<cr>', { desc = 'Find session' })
