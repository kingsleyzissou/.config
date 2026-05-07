M = {}

-- default color palette
local default = {
  -- catppuccin default colors
  none = 'None',
  base = '#1e2030',
  surface = '#24273a',
  overlay = '#363a4f',
  text = '#b4befe',
  subtext = '#b8c0e0',
  blue = '#94e2d5',
  green = '#a6e3a1',
  pink = '#f2cdcd',
  red = '#f38ba8',
  purple = '#cba6f7',
  yellow = '#eed49f',
}

local function get_theme()
  if vim.g.colors_name == 'catppuccin-mocha' then
    local palette = require('catppuccin.palettes').get_palette('macchiato')
    return {
      none = 'None',
      base = palette.mantle,
      surface = palette.base,
      overlay = palette.surface0,
      text = palette.text,
      subtext = palette.subtext0,
      blue = palette.teal,
      green = palette.green,
      pink = palette.flamingo,
      red = palette.red,
      purple = palette.mauve,
      yellow = palette.yellow,
    }
  end
  if vim.g.colors_name == 'rose-pine' then
    local palette = require('rose-pine.palette')
    return {
      none = 'None',
      base = palette.base,
      surface = palette.surface,
      overlay = palette.overlay,
      text = palette.text,
      subtext = palette.subtle,
      blue = palette.foam,
      green = palette.pine,
      pink = palette.rose,
      red = palette.love,
      purple = palette.iris,
      yellow = palette.gold,
    }
  end
  return default
end

M.get_theme = get_theme

return M
