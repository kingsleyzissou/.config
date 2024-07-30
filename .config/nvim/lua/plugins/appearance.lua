return {
  {
    -- main theme
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavor = 'macchiato',
        transparent_background = true,
      })
      vim.cmd.colorscheme('catppuccin')
    end,
  },

  {
    -- inline hex colors
    'norcalli/nvim-colorizer.lua',
  },

  {
    -- indent guides
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufEnter', 'BufNewFile' },
    main = 'ibl',
    opts = {
      indent = { char = '|' },
    },
  },

  {
    -- icons
    'nvim-tree/nvim-web-devicons',
    config = function(_, opts)
      require('nvim-web-devicons').setup(opts)
    end,
  },

  {
    -- required by other plugins, import explicitly
    'MunifTanjim/nui.nvim',
  },

  {
    -- lualine
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function()
      -- custom theme
      local theme = require('config.theme.lualine')
      return {
        options = {
          disabled_filetypes = { 'neo-tree', 'toggleterm', 'trouble', 'minimap' },
          icons_enabled = true,
          section_separators = '',
          theme = theme(),
        },
        sections = {
          lualine_x = {
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

  {
    -- indentation
    'lukas-reineke/indent-blankline.nvim',
  },

  {
    -- noice
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      lsp = {
        progress = {
          enabled = true,
          view = 'mini',
          format = 'lsp_progress',
          format_done = 'lsp_progress_done',
          throttle = 1000 / 30, -- frequency to update lsp progress message
        },
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
            },
          },
          view = 'mini',
        },
      },
      presets = {
        -- bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
      },
      views = {
        cmdline_popup = {
          border = {
            style = 'none',
            radius = 2,
            padding = { 1, 2 },
          },
          filter_options = {},
          win_options = {
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
          },
        },
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
    },
    config = false,
  },

  {
    -- zen mode!!
    'folke/zen-mode.nvim',
    keys = {
      { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen mode' },
    },
  },

  {
    -- twilight effect for zen mode
    'folke/twilight.nvim',
    opts = {
      enabled = true,
    },
  },
}
