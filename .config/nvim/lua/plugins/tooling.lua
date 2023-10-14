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
  },
}
