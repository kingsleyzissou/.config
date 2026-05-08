return {
  {
    -- harpoon navigation
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = function() require('harpoon'):setup() end,
    keys = {
      { '<leader>ma', function() require('harpoon'):list():add() end, desc = 'Add mark' },
      { '<leader>mk', function() require('harpoon'):list():next() end, desc = 'Next mark' },
      { '<leader>mj', function() require('harpoon'):list():prev() end, desc = 'Previous mark' },
      { '<leader>m1', function() require('harpoon'):list():select(1) end, desc = 'Navigate to mark 1' },
      { '<leader>m2', function() require('harpoon'):list():select(2) end, desc = 'Navigate to mark 2' },
      { '<leader>m3', function() require('harpoon'):list():select(3) end, desc = 'Navigate to mark 3' },
      { '<leader>m4', function() require('harpoon'):list():select(4) end, desc = 'Navigate to mark 4' },
    },
  },
}
