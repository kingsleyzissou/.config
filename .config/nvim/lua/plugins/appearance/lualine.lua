return {
  {
    -- lualine
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function()
      local wtf = require('wtf')
      -- custom theme
      return {
        options = {
          disabled_filetypes = { 'neo-tree', 'toggleterm', 'trouble', 'minimap', 'snacks_terminal' },
          icons_enabled = true,
          section_separators = '',
          theme = function()
            -- dynamically configure the lualine
            -- theme colors
            return require('theme.lualine').setup()
          end,
        },
        sections = {
          lualine_x = {
            wtf.get_status,
          },
          lualine_y = {
            {
              require('noice').api.statusline.mode.get,
              cond = require('noice').api.statusline.mode.has,
              color = { fg = '#a5adcb' },
            },
          },
        },
      }
    end,
  },
}
