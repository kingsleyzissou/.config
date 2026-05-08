local colors = require('theme.colors').get_theme()
local M = {}

-- just re-export this for convenience
M.colors = colors

M.theme = function()
  return {
    inactive = {
      a = { fg = colors.surface, bg = colors.overlay, gui = 'bold' },
      b = { fg = colors.none, bg = colors.none },
      c = { fg = colors.text, bg = colors.none },
    },
    visual = {
      a = { fg = colors.surface, bg = colors.pink, gui = 'bold' },
      b = { fg = colors.text, bg = colors.overlay },
      c = { fg = colors.text, bg = colors.none },
    },
    replace = {
      a = { fg = colors.surface, bg = colors.red, gui = 'bold' },
      b = { fg = colors.text, bg = colors.overlay },
      c = { fg = colors.text, bg = colors.none },
    },
    normal = {
      a = { fg = colors.surface, bg = colors.blue, gui = 'bold' },
      b = { fg = colors.text, bg = colors.overlay },
      c = { fg = colors.text, bg = colors.none },
    },
    insert = {
      a = { fg = colors.surface, bg = colors.green, gui = 'bold' },
      b = { fg = colors.text, bg = colors.overlay },
      c = { fg = colors.text, bg = colors.none },
    },
    command = {
      a = { fg = colors.surface, bg = colors.purple, gui = 'bold' },
      b = { fg = colors.text, bg = colors.overlay },
      c = { fg = colors.text, bg = colors.none },
    },
  }
end

return M
