M = {}

-- default color palette
local default = {
  tokyonight = {
    none = nil,
    black = '#24283b',
    white = '#c0caf5',
    dark = '#24283b',
    normal = '#7aa2f7',
    insert = '#9ece6a',
    visual = '#e0af68',
    replace = '#f7768e',
    command = '#9d7cd8',
  },
  catppuccin = {
    none = nil,
    black = '#1e1e2e',
    white = '#b4befe',
    dark = '#313244',
    normal = '#94e2d5',
    insert = '#a6e3a1',
    visual = '#f2cdcd',
    replace = '#f38ba8',
    command = '#cba6f7',
  },
}

local function colors()
  if vim.g.colors_name == 'tokyonight' then
    local palette = require('tokyonight.colors').setup({ transform = true })
    return {
      none = nil,
      black = palette.black,
      white = palette.fg,
      dark = palette.bg,
      normal = palette.blue,
      insert = palette.green,
      visual = palette.yellow,
      replace = palette.red,
      command = palette.purple,
    }
  end
  if vim.g.colors_name == 'catppuccin' then
    local palette = require('catppuccin.palettes').get_palette('macchiato')
    return {
      none = nil,
      black = palette.base,
      white = palette.text,
      dark = palette.surface0,
      normal = palette.teal,
      insert = palette.green,
      visual = palette.flamingo,
      replace = palette.red,
      command = palette.mauve,
    }
  end
  return default.catppuccin
end

M.colors = colors

return M
