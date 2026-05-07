return {
  {
    -- which-key
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      -- preset = 'helix',
      plugins = {
        marks = true,
        registers = true,
      },
      key_labels = {
        ['<leader>'] = 'SPC',
      },
      popup_mappings = {
        scroll_down = '<C-j>',
        scroll_up = '<C-k>',
      },
      hidden = { '<leader>w' },
      icons = {
        mappings = false,
      },
    },
    config = function()
      local wk = require('which-key')
      wk.add({
        { '<leader>c', group = 'Terminal' },
        { '<leader>f', group = 'Finder' },
        { '<leader>g', group = 'Git' },
        { '<leader>l', group = 'Diagnostics' },
        { '<leader>m', group = 'Harpoon' },
        { '<leader>p', group = 'Lazy' },
        { '<leader>s', group = 'Splits' },
        { '<leader>x', group = 'Trouble' },
        { '<leader>-', hidden = true },
        { '<leader>.', hidden = true },
        { '<leader>,', hidden = true },
        { '<leader>w', hidden = true },
        { '<leader>q', hidden = true },
        { '<leader>j', hidden = true },
        { '<leader>k', hidden = true },
      })
    end,
  },
}
