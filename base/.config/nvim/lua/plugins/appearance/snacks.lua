return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      lazygit = { enabled = true },
      input = { enabled = false },
      notifier = { enabled = false },
      notify = { enabled = true },
      picker = { enabled = true },
      rename = { enabled = true },
      scope = { enabled = true },
      terminal = { enabled = true },
      zen = { enabled = true },
      styles = {
        terminal = {
          position = 'float',
          backdrop = 60,
          height = 0.9,
          width = 0.9,
          zindex = 50,
          border = false,
          keys = {
            q = 'hide',
            esc = { '<esc>', 'hide', mode = 'n' },
          },
        },
      },
    },
  },
}
