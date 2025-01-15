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
      local ok, signs = pcall(require, 'gitsigns')
      if not ok then
        return {}
      end
      return {
        { '<leader>gj', signs.next_hunk, desc = 'Next hunk' },
        { '<leader>gk', signs.prev_hunk, desc = 'Previous hunk' },
        { '<leader>gp', signs.preview_hunk, desc = 'Preview hunk' },
        { '<leader>gr', signs.reset_hunk, desc = 'Reset hunk' },
        { '<leader>gR', signs.reset_buffer, desc = 'Reset buffer' },
        { '<leader>gs', signs.stage_hunk, desc = 'Stage hunk' },
        { '<leader>gu', signs.undo_stage_hunk, desc = 'Undo stage hunk' },
        { '<leader>gx', signs.toggle_deleted, desc = 'Toggle deleted' },
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
