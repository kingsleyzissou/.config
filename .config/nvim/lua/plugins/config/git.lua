return {
  {
    -- git signs
    'lewis6991/gitsigns.nvim',
    opts = {
      preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
    },
    keys = function()
      local signs = require('gitsigns')
      return {
        { '<leader>gj', signs.next_hunk, desc = 'Next hunk' },
        { '<leader>gk', signs.prev_hunk, desc = 'Previous hunk' },
        { '<leader>gp', signs.preview_hunk, desc = 'Preview hunk' },
        { '<leader>gr', signs.reset_hunk, desc = 'Reset hunk' },
        { '<leader>gR', signs.reset_buffer, desc = 'Reset buffer' },
        { '<leader>gs', signs.stage_hunk, desc = 'Stage hunk' },
        { '<leader>gu', signs.undo_stage_hunk, desc = 'Undo stage hunk' },
        { '<leader>gx', signs.toggle_deleted, desc = 'Toggle deleted' },
        { '<leader>gd', signs.diffthis, desc = 'Diff this' },
      }
    end,
  },

  {
    -- lazygit
    'kdheepak/lazygit.nvim',
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
