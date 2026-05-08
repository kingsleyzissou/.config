return {
  {
    -- lualine
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function()
      local statusline = require('components.statusline.options')
      -- custom theme
      return {
        options = {

          disabled_filetypes = { 'neo-tree', 'toggleterm', 'trouble', 'minimap', 'snacks_terminal' },
          icons_enabled = true,
          section_separators = '',
          component_separators = '|',
          theme = statusline.theme(),
        },
        sections = statusline.sections,
      }
    end,
  },
}
