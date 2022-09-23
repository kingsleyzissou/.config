local current = require('highlight_current_n')

current.setup({ highlight_group = 'IncSearch' })

local map = vim.keymap.set
map('n', 'n', '<Plug>(highlight-current-n-n)')
