return {
  {
    'NeogitOrg/neogit',
    opts = {},
    keys = function()
      local neogit = require('neogit')
      -- stylua: ignore
      return {
        { '<leader>gg', neogit.open, desc = 'NeoGit' },
        { '<leader>gr', function() neogit.open({ 'rebase' }) end, desc = 'Neogit Rebase' },
        { '<leader>gp', function() neogit.open({ 'push' }) end, desc = 'Neogit Push' },
        { '<leader>gl',  function()neogit.open({ 'log' }) end, desc = 'Neogit Log' },
      }
    end,
  },

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
        { '<leader>ghp', gs.preview_hunk, desc = 'Preview hunk' },
        { '<leader>ghr', gs.reset_hunk, desc = 'Reset hunk' },
        { '<leader>ghR', gs.reset_buffer, desc = 'Reset buffer' },
        { '<leader>ghs', gs.stage_hunk, desc = '(Un)Stage hunk' },
        { '<leader>ghx', gs.preview_hunk_inline, desc = 'Toggle deleted' },
        { '<leader>gdo', '<cmd>DiffviewOpen<cr>', desc = 'Diff view open' },
        { '<leader>gdc', '<cmd>DiffviewClose<cr>', desc = 'Diff view close' },
        {
          '<leader>ghj',
          function()
            ---@diagnostic disable-next-line
            gs.nav_hunk('next')
          end,
          desc = 'Next hunk',
        },
        {
          '<leader>ghk',
          function()
            ---@diagnostic disable-next-line
            gs.nav_hunk('prev')
          end,
          desc = 'Previous hunk',
        },
      }
    end,
  },

  {
    -- diffview
    'sindrets/diffview.nvim',
    config = true,
  },
}
