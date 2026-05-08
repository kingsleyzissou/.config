function ChangeTheme(color)
  color = color or 'rose-pine'
  vim.cmd.colorscheme(color)
  require('theme.prompt').setup()
  require('components.finder.theme').setup()
end

vim.api.nvim_create_user_command('ChangeTheme', function(opts) ChangeTheme(opts.args) end, { nargs = 1 })
