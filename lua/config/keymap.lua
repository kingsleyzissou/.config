-- shorten the keymap function
local map = vim.keymap.set

-- save/source/quit
map('n', '<c-s>', '<cmd>w!<cr>', { desc = 'Save' })
map('n', '<c-q>', '<cmd>Bdelete<cr>', { desc = 'Quit' })
map('n', '<leader>qq', '<cmd>q!<cr>', { desc = 'Quit' })
map('n', '<leader>ww', '<cmd>w!<cr>', { desc = 'Save' })
map('n', '<leader>wq', '<cmd>wq!<cr>', { desc = 'Save & quit' })

-- better window navigation
map('n', '<c-h>', '<c-w>h', { desc = 'Window →' })
map('n', '<c-j>', '<c-w>j', { desc = 'Window ←' })
map('n', '<c-k>', '<c-w>k', { desc = 'Window ↑' })
map('n', '<c-l>', '<c-w>l', { desc = 'Window ↓' })

-- splits
map('n', '<leader>h', '<cmd>split<cr>', { desc = 'Horizontal split' })
map('n', '<leader>v', '<cmd>vsplit<cr>', { desc = 'Vertical split' })

-- resize
map('n', '<C-up>', '<cmd>resize -2<cr>', { desc = 'Increase bottom split' })
map('n', '<C-down>', '<cmd>resize +2<cr>', { desc = 'Increase top split' })
map('n', '<C-left>', '<cmd>vertical resize -2<cr>', { desc = 'Increase right split' })
map('n', '<C-right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase left split' })

-- cycle buffers
map('n', '<leader>j', '<cmd>bn<cr>', { desc = 'Next buffer' })
map('n', '<leader>k', '<cmd>bp<cr>', { desc = 'Previous buffer' })
map('n', '<leader>qb', '<cmd>Bdelete<cr>', { desc = 'Delete buffer' })

-- stay in indent mode
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '>', '>gv', { desc = 'Indent right' })

-- exit terminal
map('t', '<esc>', '<c-\\><c-n>', { desc = 'Esc terminal' })
map('t', '<c-q>', '<c-\\><c-n><cmd>q!<cr>', { desc = 'Close terminal' }) -- ctrl-q to exit terminal

-- move lines
map('n', '<a-j>', '<cmd>m .+1<cr>==', { desc = 'Move line down' })
map('n', '<a-k>', '<cmd>m .-2<cr>==', { desc = 'Move line up' })
map('v', '<a-j>', "<cmd>m '>+1<cr>gv=gv", { desc = 'Move line down' })
map('v', '<a-k>', "<cmd>m '<-2<cr>gv=gv", { desc = 'Move line up' })
map('i', '<a-j>', '<esc> <cmd>m .+1<cr>gi', { desc = 'Move line down' })
map('i', '<a-k>', '<esc> <cmd>m .-2<cr>gi', { desc = 'Move line up' })

-- packer
map('n', '<leader>pi', require('packer').install, { desc = 'Packer Install' })
map('n', '<leader>pc', require('packer').clean, { desc = 'Packer Clean' })
map('n', '<leader>ps', require('packer').sync, { desc = 'Packer Sync' })
map('n', '<leader>pu', require('packer').update, { desc = 'Packer Update' })

-- useful first class commands
map('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code action' })
map('n', '<leader>e', require('nvim-tree').toggle, { desc = 'Toggle explorer' })
map('n', '<leader>b', '<cmd>TelescopeBuffers<cr>', { desc = 'View buffers' })
