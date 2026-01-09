return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      lazygit = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      notify = { enabled = false },
      picker = { enabled = true },
      rename = { enabled = true },
      scope = { enabled = true },
      terminal = { enabled = true },
      zen = { enabled = true },
    },
    styles = {
      input = {},
    },
  },
}
