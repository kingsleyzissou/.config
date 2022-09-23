local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = 'Macro'
    return b
end

-- TODO: sort out icons
dashboard.section.buttons.val = {
    button('f', ' Find file', ':Telescope find_files <CR>'),
    button('e', ' New file', ':ene <BAR> startinsert <CR>'),
    button('p', ' Find project', ":lua require('telescope').extensions.projects.projects()<CR>"),
    button('r', ' Recent files', ':Telescope oldfiles <CR>'),
    button('t', ' Find text', ':Telescope live_grep <CR>'),
    -- dashboard.button("s", icons.ui.SignIn .. " Find Session", ":silent Autosession search <CR>"),
    button('s', ' Find Session', ':SearchSession<CR>'),
    button('c', ' Config', ':e ~/.config/nvim/init.lua <CR>'),
    button('u', ' Update', ':PackerSync<CR>'),
    button('q', ' Quit', ':qa<CR>'),
}

-- TODO: sort out footer
dashboard.section.header.opts.hl = 'Keyword'
dashboard.section.buttons.opts.hl = 'Macro'
dashboard.section.footer.opts.hl = 'Type'

alpha.setup(dashboard.config)
