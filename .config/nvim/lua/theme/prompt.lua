local colors = require('theme.colors')
local M = {}

local function setup()
  local c = colors.get_theme()
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = c.base })
end

M.setup = setup

return M
