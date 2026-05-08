local colors = require('theme.colors')
local M = {}

M.setup = function()
  -- Snacks picker styles
  -- https://www.reddit.com/r/neovim/comments/xcsatv/comment/iq32go0
  local c = colors.get_theme()
  local bg = c.none

  -- create a new highlight group
  local highlights = {
    SnacksPickerMatch = { fg = c.pink, bg = c.text },
    SnacksPickerListCursorLine = { fg = c.text, bg = c.surface, bold = true },
    -- Input/prompt
    SnacksPickerInput = { link = 'Normal' },
    SnacksPickerInputBorder = { bg = bg, fg = c.subtext },
    SnacksPickerInputTitle = { fg = c.pink, bg = bg },
    -- Results/list
    SnacksPickerList = { link = 'Normal' },
    SnacksPickerListBorder = { fg = c.subtext, bg = bg },
    SnacksPickerListTitle = { fg = c.subtext, bg = bg },
    -- Preview
    SnacksPickerPreview = { link = 'Normal' },
    SnacksPickerPreviewBorder = { fg = c.subtext, bg = c.mantle },
    SnacksPickerPreviewTitle = { fg = c.green, bg = bg },
  }

  for hl, col in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

-- M.setup = function()
--   apply()
--   vim.api.nvim_create_autocmd('ColorScheme', {
--     group = vim.api.nvim_create_augroup('picker_theme', { clear = true }),
--     callback = apply,
--   })
-- end

return M
