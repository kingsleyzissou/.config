local yanky = require('yanky')

yanky.setup()

local map = vim.keymap.set

map({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
map({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
