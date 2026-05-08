return {
  {
    'folke/snacks.nvim',
    lazy = false,
    keys = {
      { '<leader>ff', function() Snacks.picker.smart() end, desc = 'Find files' },
      { '<leader>fr', function() Snacks.picker.recent() end, desc = 'Find recent' },
      { '<leader>ft', function() Snacks.picker.grep() end, desc = 'Find text' },
      { '<leader>fs', function() Snacks.picker.grep_word() end, desc = 'Find string under cursor' },
      { '<leader>fh', function() Snacks.picker.man() end, desc = 'Find man pages' },
      { '<leader>fk', function() Snacks.picker.keymaps() end, desc = 'Find keymaps' },
      { '<leader>fg', function() Snacks.picker.git_status() end, desc = 'View git status' },
      { '<leader>fG', function() Snacks.picker.git_log() end, desc = 'View git log' },
      { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'View buffers' },
      { '<leader>fl', function() Snacks.picker.diagnostics() end, desc = 'View diagnostics' },
      { '<leader>fu', function() Snacks.picker.undo() end, desc = 'View undo tree' },
      { '<leader>fm', function() require('components.finder.marks').list() end, desc = 'View marks' },
      { '<leader>fd', function() require('components.finder.directory').pick() end, desc = 'Find in directory' },
      { '<leader>fx', function() Snacks.picker.todo_comments() end, desc = 'Find todos' },
      {
        '<leader>fX',
        function() Snacks.picker.todo_comments({ keywords = { 'TODO', 'FIX', 'FIXME' } }) end,
        desc = 'Todo/Fix/Fixme',
      },
    },
    opts = function()
      local picker = require('components.finder.options')
      return {
        picker = {
          enabled = true,
          sources = picker.sources,
          layout = picker.layout,
          win = {
            input = {
              keys = {
                ['<c-x>'] = { 'bufdelete', mode = { 'n' } },
                ['<del>'] = { 'bufdelete', mode = { 'n' } },
              },
            },
          },
        },
      }
    end,
  },
}
