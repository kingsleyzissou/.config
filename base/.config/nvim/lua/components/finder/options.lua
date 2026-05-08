local M = {}

M.layout = {
  reverse = true,
  layout = {
    box = 'horizontal',
    backdrop = false,
    width = 0,
    height = 0,
    border = 'none',
    {
      box = 'vertical',
      {
        win = 'input',
        height = 1,
        border = 'single',
        title = '{title} {live} {flags}',
        title_pos = 'center',
      },
      { win = 'list', border = 'single' },
    },
    {
      win = 'preview',
      title = '{preview:Preview}',
      width = 0.45,
      border = 'single',
      title_pos = 'center',
    },
  },
}

M.sources = {

  files = {
    hidden = true,
    follow = false,
    ignored = false,
  },
  grep = {
    hidden = true,
    follow = true,
  },
}

return M
