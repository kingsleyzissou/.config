-- save/source/quit
vim.keymap.set('n', '<c-c>', '<cmd>wq!<cr>', { desc = 'Save' })
vim.keymap.set('n', '<c-q>', '<cmd>Bdelete<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>qq', '<cmd>q!<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>ww', '<cmd>w!<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>wq', '<cmd>wq!<cr>', { desc = 'Save & quit' })

-- lazy
vim.keymap.set('n', '<leader>pi', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- shift-k // split line at cursor
vim.keymap.set({ 'n', 'v' }, '<s-k>', 'i<cr><esc>', { desc = 'Split line' })

-- cycle buffers
vim.keymap.set('n', '<leader>j', '<cmd>bn<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>k', '<cmd>bp<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>-', '<C-6>', { desc = 'Last opened buffer' })
vim.keymap.set('n', '<leader>qb', '<cmd>Bdelete<cr>', { desc = 'Delete buffer' })

-- stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- copy/paste stuff
vim.keymap.set({ 'n', 'v' }, '<a-y>', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<a-c>', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<a-v>', '"+p"+Y', { desc = 'Paste from system clipboard' })
vim.keymap.set('v', '<a-v>', 'c<ESC>"+p', { desc = 'Paste from system clipboard' })

-- send deletes to the ether
vim.keymap.set('x', '<a-p>', '"_dP') -- delete current word into the void
vim.keymap.set({ 'n', 'v' }, 'x', '"_x') -- delete char into the void

-- exit terminal
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Esc terminal' })
vim.keymap.set('t', '<c-q>', '<c-\\><c-n><cmd>q!<cr>', { desc = 'Close terminal' }) -- ctrl-q to exit terminal

-- move lines
vim.keymap.set('n', '<a-j>', '<cmd>m .+1<cr>==', { desc = 'Move line down' })
vim.keymap.set('n', '<a-k>', '<cmd>m .-2<cr>==', { desc = 'Move line up' })
vim.keymap.set('v', '<a-j>', "<cmd>m '>+1<cr>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', '<a-k>', "<cmd>m '<-2<cr>gv=gv", { desc = 'Move line up' })
vim.keymap.set('i', '<a-j>', '<esc> <cmd>m .+1<cr>gi', { desc = 'Move line down' })
vim.keymap.set('i', '<a-k>', '<esc> <cmd>m .-2<cr>gi', { desc = 'Move line up' })

-- centre stuff in centre of the screen
-- https://youtu.be/w7i4amO_zaE?t=1464
vim.keymap.set('n', '<c-d>', '<C-d>zz', { desc = 'Jump half page down' })
vim.keymap.set('n', '<c-f>', '<C-d>zz', { desc = 'Jump half page down' })
vim.keymap.set('n', '<c-]>', '<C-d>zz', { desc = 'Jump half page down' })
vim.keymap.set('n', '<c-u>', '<C-u>zz', { desc = 'Jump half page up' })
vim.keymap.set('n', '<c-b>', '<C-u>zz', { desc = 'Jump half page up' })
vim.keymap.set('n', '<c-[>', '<C-u>zz', { desc = 'Jump half page up' })
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- emacs key jumping
vim.keymap.set('n', '<c-a>', '^', { desc = 'Jump to start of line' })
vim.keymap.set('n', '<c-e>', '$', { desc = 'Jump to end of line' })

-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
local replace = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<left><left><left>]]
vim.keymap.set('n', '<c-r>', replace, { desc = 'Replace word' })
