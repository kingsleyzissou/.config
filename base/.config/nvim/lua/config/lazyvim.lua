local config = function()
  return {
    install = {
      colorscheme = { require('theme.lazyvim').setup() },
    },
    change_detection = {
      notify = false,
    },
  }
end

require('lazy').setup({
  { import = 'plugins.lsp' },
  { import = 'plugins.linting' },
  { import = 'plugins.formatting' },
  { import = 'plugins.coding' },
  { import = 'plugins.editor' },
  { import = 'plugins.appearance' },
}, config())
