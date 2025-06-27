local colors = require('theme.colors')
local M = {}

local function setup()
  -- Telescope Styles
  -- https://www.reddit.com/r/neovim/comments/xcsatv/comment/iq32go0
  local c = colors.get_theme()
  local bg = vim.g.colors_name == 'rose-pine' and c.surface or c.base

  -- create a new highlight group

  local highlights = {
    TelescopeMatching = {
      fg = c.pink,
      bg = c.text,
    },
    TelescopeSelection = {
      fg = c.text,
      bg = c.surface,
      bold = true,
    },

    -- Prompt component
    TelescopePromptBorder = {
      bg = c.overlay,
      fg = c.overlay,
    },
    TelescopePromptNormal = {
      bg = c.overlay,
    },
    TelescopePromptPrefix = {
      bg = c.overlay,
    },
    TelescopePromptTitle = {
      fg = c.pink,
      bg = c.overlay,
    },

    -- Results component
    TelescopeResultsBorder = {
      fg = bg,
      bg = bg,
    },
    TelescopeResultsNormal = {
      bg = bg,
    },
    TelescopeResultsTitle = {
      fg = c.subtle,
      bg = bg,
    },

    -- Preview component
    TelescopePreviewBorder = {
      fg = bg,
      bg = bg,
    },
    TelescopePreviewNormal = {
      bg = bg,
    },
    TelescopePreviewTitle = {
      fg = c.green,
      bg = bg,
    },
  }

  for hl, col in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

M.setup = setup

return M
