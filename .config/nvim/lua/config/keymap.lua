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

-- search for word under cursor
vim.keymap.set({ 'n', 'x' }, 'gw', '*N', { desc = 'Search word under cursor' })

-- resize
vim.keymap.set('n', '<C-up>', '<cmd>resize -2<cr>', { desc = 'Increase bottom split' })
vim.keymap.set('n', '<C-down>', '<cmd>resize +2<cr>', { desc = 'Increase top split' })
vim.keymap.set('n', '<C-left>', '<cmd>vertical resize -2<cr>', { desc = 'Increase right split' })
vim.keymap.set('n', '<C-right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase left split' })

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
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Jump half page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Jump half page up' })
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
-- stylua: ignore
local replace = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<left><left><left>]]
vim.keymap.set('n', '<leader>r', replace, { desc = 'Replace word' })
