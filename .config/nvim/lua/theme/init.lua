require('theme.change')
require('theme.prompt').setup()
require('theme.neotest').setup()
require('theme.telescope').setup()

if os.getenv('THEME') then
  vim.cmd.colorscheme(os.getenv('THEME'))
end
