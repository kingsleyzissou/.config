local colors = require('theme.colors')
local M = {}

local function setup()
  local c = colors.get_theme()

  local highlights = {
    NeotestAdapterName = { fg = c.purple },
    NeotestDir = { fg = c.blue },
    NeotestExpandMarker = { fg = c.surface },
    NeotestFailed = { fg = c.red },
    NeotestFile = { fg = c.blue },
    NeotestFocused = { bg = c.base },
    NeotestIndent = { fg = c.pink },
    NeotestNamespace = { fg = c.blue },
    NeotestPassed = { fg = c.green },
    NeotestRunning = { fg = c.yellow },
    NeotestSkipped = { fg = c.subtext },
  }

  for hl, col in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

M.setup = setup

return M
