return {
  {

    'obsidian-nvim/obsidian.nvim',
    version = '*',
    event = {
      'BufReadPre /Users/zissou/Documents/obsidian/*.md',
      'BufNewFile /Users/zissou/Documents/obsidian/*.md',
    },
    opts = {
      -- use render markdown instead
      ui = { enable = false },
      workspaces = {
        {
          name = 'work',
          path = '~/Documents/obsidian',
        },
      },
    },
  },
}
