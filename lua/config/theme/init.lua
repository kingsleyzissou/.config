require('tokyonight').setup({
    terminal_colors = true,
    transparent = true,
    styles = {
        sidebars = 'transparent',
        floats = 'transparent',
    },
    on_highlights = function(highlights, colors)
        highlights.MsgArea = { bg = colors.none }
    end,
})

require('catppuccin').setup({
    transparent_background = true,
})

function ChangeTheme(color)
    color = color or 'catppuccin'
    vim.cmd.colorscheme(color)
    require('config.theme.lualine').setup()
end

vim.api.nvim_create_user_command('ChangeTheme', function(opts)
    ChangeTheme(opts.args)
end, { nargs = 1 })

ChangeTheme()
