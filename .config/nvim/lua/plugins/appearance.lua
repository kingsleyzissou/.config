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
    -- backup theme
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = true,
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
      on_highlights = function(highlights, colors)
        highlights.MsgArea = { bg = colors.none }
      end,
    },
  },

  -- {
  -- highlighting
  -- 'RRethy/vim-illuminate',
  -- },

  {
    -- inline hex colors
    'norcalli/nvim-colorizer.lua',
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

  {
    -- edgy
    'folke/edgy.nvim',
    event = 'VeryLazy',
    -- stylua: ignore
    keys = {
      { '<leader>be', function() require('edgy').toggle() end, desc = 'Edgy Toggle' },
      { '<leader>bE', function() require('edgy').select() end, desc = 'Edgy Select Window' },
    },
    opts = function()
      local opts = {
        bottom = {
          {
            ft = 'toggleterm',
            size = { height = 0.4 },
            filter = function(_, win)
              return vim.api.nvim_win_get_config(win).relative == ''
            end,
          },
          {
            ft = 'noice',
            size = { height = 0.4 },
            filter = function(_, win)
              return vim.api.nvim_win_get_config(win).relative == ''
            end,
          },
          'Trouble',
          { ft = 'qf', title = 'QuickFix' },
          {
            ft = 'help',
            size = { height = 20 },
            -- don't open help files in edgy that we're editing
            filter = function(buf)
              return vim.bo[buf].buftype == 'help'
            end,
          },
          { title = 'Neotest Output', ft = 'neotest-output-panel', size = { height = 15 } },
        },
        keys = {
          -- increase width
          ['<c-Right>'] = function(win)
            win:resize('width', 2)
          end,
          -- decrease width
          ['<c-Left>'] = function(win)
            win:resize('width', -2)
          end,
          -- increase height
          ['<c-Up>'] = function(win)
            win:resize('height', 2)
          end,
          -- decrease height
          ['<c-Down>'] = function(win)
            win:resize('height', -2)
          end,
        },
      }
      return opts
    end,
  },
}
