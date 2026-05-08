local config = function()
  local colorscheme = function()
    if os.getenv('THEME') then return { os.getenv('THEME') } end
    if vim.g.colors_name then return { vim.g.colors_name } end
    return { 'rose-pine' }
  end

  return {
    install = {
      colorscheme = colorscheme(),
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
