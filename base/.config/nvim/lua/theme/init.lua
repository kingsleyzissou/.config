require('theme.change')

if os.getenv('THEME') then
  -- stylua will try fold this
  vim.cmd.colorscheme(os.getenv('THEME'))
end

require('theme.prompt').setup()
require('components.finder.theme').setup()
