local colors = require('theme.colors')
local M = {}

local function setup()
  -- Telescope Styles
  -- https://www.reddit.com/r/neovim/comments/xcsatv/comment/iq32go0
  local c = colors.get_theme()
  local bg = c.none

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
      bg = bg,
      fg = c.subtext,
    },
    TelescopePromptNormal = {
      bg = bg,
    },
    TelescopePromptPrefix = {
      bg = bg,
    },
    TelescopePromptTitle = {
      fg = c.pink,
      bg = bg,
    },

    -- Results component
    TelescopeResultsBorder = {
      fg = c.subtext,
      bg = bg,
    },
    TelescopeResultsNormal = {
      bg = bg,
    },
    TelescopeResultsTitle = {
      fg = c.subtext,
      bg = bg,
    },

    -- Preview component
    TelescopePreviewBorder = {
      fg = c.subtext,
      bg = c.mantle,
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
