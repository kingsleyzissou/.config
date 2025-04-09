return {
  {
    -- main theme
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        variant = 'main',
        styles = {
          transparency = true,
        },
      })
      vim.cmd.colorscheme('rose-pine')
    end,
  },

  {
    -- backup theme
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavor = 'macchiato',
        transparent_background = true,
        integrations = {
          gitsigns = true,
          telescope = true,
        },
      })
      -- vim.cmd.colorscheme('catppuccin')
    end,
  },

  {
    -- icons
    'nvim-tree/nvim-web-devicons',
    opts = {},
  },

  {
    'echasnovski/mini.icons',
    opts = {},
    lazy = true,
    specs = {
      { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
    },
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },

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
              require('noice').api.status.message.get,
              cond = require('noice').api.status.mode.has,
              color = { fg = '#a5adcb' },
            },
          },
        },
      }
    end,
  },

  -- snacks
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      lazygit = { enabled = true },
      input = { enabled = false },
      notifier = { enabled = true },
      notify = { enabled = true },
      rename = { enabled = true },
      scope = { enabled = true },
      terminal = { enabled = true },
      zen = { enabled = true },
    },
    styles = {
      input = {},
    },
    keys = {
      {
        '<leader>gg',
        function()
          require('snacks').lazygit()
        end,
        desc = 'Lazygit',
      },
    },
  },

  {
    -- noice
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
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
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = true,
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
