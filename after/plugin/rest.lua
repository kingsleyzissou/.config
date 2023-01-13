local rest = require('rest-nvim')

rest.setup()

-- keymaps
local map = vim.keymap.set
map('n', '<leader>rr', '<Plug>RestNvim', { desc = 'Rest request' })
map('n', '<leader>rp', '<Plug>RestNvimPreview', { desc = 'Rest preview' })
map('n', '<leader>rl', '<Plug>RestNvimLast', { desc = 'Rest re-run' })
