return {
  {
    'folke/trouble.nvim',
    opts = {
      position = 'bottom',
      use_diagnostic_signs = false,
    },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Document Diagnostics' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List' },
    },
  },

  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble' },
    event = { 'BufReadPost', 'BufNewFile' },
    config = true,
    keys = {
      { ']t', function() require('todo-comments').jump_next() end, desc = 'Next todo comment' },
      { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous todo comment' },
    },
  },
}
