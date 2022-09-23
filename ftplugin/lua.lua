vim.opt.formatoptions:remove('r')
vim.opt.formatoptions:remove('o')
vim.opt.endofline = true

-- keymap
local map = vim.keymap.set
map('n', '<leader>ws', '<cmd>w!<cr><cmd>so<cr>', { desc = 'Save & source' })
