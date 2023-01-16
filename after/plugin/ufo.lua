local ufo = require('ufo')

-- setup fold remaps
vim.keymap.set('n', 'zM', ufo.closeAllFolds, { desc = 'Close all folds' })
vim.keymap.set('n', 'zR', ufo.openAllFolds, { desc = 'Open all folds' })
