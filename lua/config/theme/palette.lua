M = {}

-- default color palette
local default = {
    none = nil,
    black = '#24283b',
    white = '#c0caf5',
    dark = '#24283b',
    normal = '#7aa2f7',
    insert = '#9ece6a',
    visual = '#e0af68',
    replace = '#f7768e',
    command = '#9d7cd8',
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
        local palette = require('catppuccin.palettes').get_palette('mocha')
        return {
            none = nil,
            black = palette.crust,
            white = palette.text,
            dark = palette.base,
            normal = palette.blue,
            insert = palette.green,
            visual = palette.yellow,
            replace = palette.red,
            command = palette.mauve,
        }
    end
    return default
end

M.colors = colors

return M
