local lualine = require('lualine')
local palette = require('config.theme.palette')

local M = {}

local function theme()
    print(palette)
    local colors = palette.colors()
    return {
        inactive = {
            a = { fg = colors.black, bg = colors.dark, gui = 'bold' },
            b = { fg = colors.none, bg = colors.none },
            c = { fg = colors.white, bg = colors.none },
        },
        visual = {
            a = { fg = colors.black, bg = colors.visual, gui = 'bold' },
            b = { fg = colors.white, bg = colors.dark },
            c = { fg = colors.white, bg = colors.none },
        },
        replace = {
            a = { fg = colors.black, bg = colors.replace, gui = 'bold' },
            b = { fg = colors.white, bg = colors.dark },
            c = { fg = colors.white, bg = colors.none },
        },
        normal = {
            a = { fg = colors.black, bg = colors.normal, gui = 'bold' },
            b = { fg = colors.white, bg = colors.dark },
            c = { fg = colors.white, bg = colors.none },
        },
        insert = {
            a = { fg = colors.black, bg = colors.insert, gui = 'bold' },
            b = { fg = colors.white, bg = colors.dark },
            c = { fg = colors.white, bg = colors.none },
        },
        command = {
            a = { fg = colors.black, bg = colors.command, gui = 'bold' },
            b = { fg = colors.white, bg = colors.dark },
            c = { fg = colors.white, bg = colors.none },
        },
    }
end

M.setup = function()
    lualine.setup({
        options = {
            theme = theme(),
        },
    })
end

return M
