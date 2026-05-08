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
    lazy = false, -- needed for keybindings
    keys = function()
      local gs = require('gitsigns')
      return {
        { '<leader>gb', gs.blame_line, desc = 'Git Blame' },
        { '<leader>gp', gs.preview_hunk, desc = 'Preview hunk' },
        { '<leader>gr', gs.reset_hunk, desc = 'Reset hunk' },
        { '<leader>gR', gs.reset_buffer, desc = 'Reset buffer' },
        { '<leader>gs', gs.stage_hunk, desc = '(Un)Stage hunk' },
        { '<leader>gx', gs.preview_hunk_inline, desc = 'Toggle deleted' },
        { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
        {
          '<leader>gj',
          function()
            ---@diagnostic disable-next-line
            gs.nav_hunk('next')
          end,
          desc = 'Next hunk',
        },
        {
          '<leader>gk',
          function()
            ---@diagnostic disable-next-line
            gs.nav_hunk('prev')
          end,
          desc = 'Previous hunk',
        },
        { '<leader>gdo', '<cmd>DiffviewOpen<cr>', desc = 'Diff view open' },
        { '<leader>gdc', '<cmd>DiffviewClose<cr>', desc = 'Diff view close' },
      }
    end,
  },

  {
    -- diffview
    'sindrets/diffview.nvim',
    config = true,
  },
}
