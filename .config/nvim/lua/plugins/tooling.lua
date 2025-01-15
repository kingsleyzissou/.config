return {
  {
    -- ray-x/go.nvim
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua',
    },
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    config = true,
    build = ':lua require("go.install").update_all_sync()',
    keys = {
      { '<leader>lgt', '<cmd>GoAddTag<cr>', desc = 'Add Go struct tags' },
      { '<leader>lge', '<cmd>GoIfErr<cr>', desc = 'Add Go error checking' },
    },
  },
}
