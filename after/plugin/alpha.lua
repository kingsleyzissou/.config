local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = 'Macro'
    return b
end

dashboard.section.buttons.val = {
    button('f', ' Find file', '<cmd>Telescope find_files<cr>'),
    button('e', ' New file', '<cmd>ene <BAR> startinsert<cr>'),
    button('r', ' Recent files', '<cmd>Telescope oldfiles<cr>'),
    button('t', ' Find text', '<cmd>Telescope live_grep<cr>'),
    button('c', ' Config', '<cmd>e ~/.config/nvim/init.lua<cr>'),
    button('u', ' Update', '<cmd>PackerSync<cr>'),
    button('q', ' Quit', '<cmd>qa<cr>'),
}

dashboard.section.header.opts.hl = 'Keyword'
dashboard.section.buttons.opts.hl = 'Macro'
dashboard.section.footer.opts.hl = 'Type'

alpha.setup(dashboard.config)
