vim.opt.formatoptions:remove('r')
vim.opt.formatoptions:remove('o')
vim.opt.endofline = true

-- keymap
vim.keymap.set('n', '<leader>ws', '<cmd>w!<cr><cmd>so<cr>', { desc = 'Save & source' })
