local notify = require('notify')

notify.setup({
  background_colour = '#24283b',
})

vim.keymap.set('n', '<leader>nd', notify.dismiss, { desc = 'Dismiss notifications' })
