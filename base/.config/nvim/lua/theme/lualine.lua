local colors = require('theme.colors')
local M = {}

local function setup()
  local c = colors.get_theme()

  return {
    inactive = {
      a = { fg = c.surface, bg = c.overlay, gui = 'bold' },
      b = { fg = c.none, bg = c.none },
      c = { fg = c.text, bg = c.none },
    },
    visual = {
      a = { fg = c.surface, bg = c.pink, gui = 'bold' },
      b = { fg = c.text, bg = c.overlay },
      c = { fg = c.text, bg = c.none },
    },
    replace = {
      a = { fg = c.surface, bg = c.red, gui = 'bold' },
      b = { fg = c.text, bg = c.overlay },
      c = { fg = c.text, bg = c.none },
    },
    normal = {
      a = { fg = c.surface, bg = c.blue, gui = 'bold' },
      b = { fg = c.text, bg = c.overlay },
      c = { fg = c.text, bg = c.none },
    },
    insert = {
      a = { fg = c.surface, bg = c.green, gui = 'bold' },
      b = { fg = c.text, bg = c.overlay },
      c = { fg = c.text, bg = c.none },
    },
    command = {
      a = { fg = c.surface, bg = c.purple, gui = 'bold' },
      b = { fg = c.text, bg = c.overlay },
      c = { fg = c.text, bg = c.none },
    },
  }
end

M.setup = setup

return M
