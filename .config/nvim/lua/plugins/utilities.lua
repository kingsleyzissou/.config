return {
  {
    -- auto-pairs
    'windwp/nvim-autopairs',
    opts = {
      fast_wrap = {},
      disable_filetype = { 'TelescopePrompt', 'vim' },
    },
    config = function(_, options)
      require('nvim-autopairs').setup(options)

      -- setup cmp for autopairs
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },

  {
    -- add comments
    'tpope/vim-commentary',
    lazy = false,
  },

  {
    -- db browser
    'tpope/vim-dadbod',
  },

  {
    -- surround plugin
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = true,
  },

  {
    -- matching keywords, i.e. if/end
    'tpope/vim-endwise',
  },

  {
    -- switch args in params list
    'AndrewRadev/sideways.vim',
    config = true,
    keys = {
      { '<a-[>', '<cmd>SidewaysLeft<cr>', desc = 'Move arg left' },
      { '<a-]>', '<cmd>SidewaysRight<cr>', desc = 'Move arg right' },
      { '<a-a>', '<cmd>SidewaysJumpRight<cr>' },
    },
  },

  {
    -- wrapping
    'andrewferrier/wrapping.nvim',
    opts = {
      opts = {
        auto_set_mode_filetype_allowlist = {
          'gitcommit',
        },
      },
    },
  },

  {
    'gorbit99/codewindow.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      { '<leader>c', '<cmd>lua require("codewindow").toggle_minimap()<cr>', desc = 'Toggle code window' },
    },
    opts = {
      exclude_filetypes = {
        'help',
        'startify',
        'aerial',
        'lazy',
        'neogitstatus',
        'neo-tree',
        'Trouble',
        'noice',
        'qf',
        'mason',
        'oil',
        '',
      },
      auto_enable = false,
      relative = 'editor',
      screen_bounds = 'background',
      width_multiplier = 5,
      window_border = '',
      use_lsp = true,
      use_treesitter = true,
      use_git = true,
    },
  },

  {
    -- markdown preview
    'ellisonleao/glow.nvim',
    config = true,
    cmd = 'Glow',
  },

  {
    -- increment and decrement values
    'monaqa/dial.nvim',
    init = function()
      local dial = require('dial.map')
      local augend = require('dial.augend')

      require('dial.config').augends:register_group({
        custom = {
          augend.constant.new({
            elements = { '&&', '||' },
            word = false,
            cyclic = true,
          }),
          augend.constant.new({
            elements = { 'True', 'False' },
            word = true,
            cyclic = true,
          }),
          augend.hexcolor.new({
            case = 'lower',
          }),
          augend.date.alias['%d/%m/%Y'],
          augend.date.alias['%Y/%m/%d'],
          augend.constant.alias.bool,
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.semver.alias.semver,
        },
      })

      -- set the keymaps in the init function since the augend
      -- groups will only be created here true
      vim.keymap.set('n', '<leader>,', dial.dec_normal('custom'), { desc = 'Decrement' })
      vim.keymap.set('n', '<leader>.', dial.inc_normal('custom'), { desc = 'Increment' })
      -- overwrite defaults to use dial instead
      vim.keymap.set('n', '<C-x>', dial.dec_normal('custom'), { desc = 'Decrement' })
      vim.keymap.set('n', '<C-a>', dial.inc_normal('custom'), { desc = 'Increment' })
    end,
  },

  {
    'rest-nvim/rest.nvim',
  },

  {
    -- which-key
    'folke/which-key.nvim',
    opts = {
      plugins = {
        marks = true,
        registers = true,
      },
      key_labels = {
        ['<leader>'] = 'SPC',
      },
      popup_mappings = {
        scroll_down = '<C-j>',
        scroll_up = '<C-k>',
      },
      hidden = { '<leader>w' },
    },
    config = function(_, options)
      local wk = require('which-key')
      wk.setup(options)
      wk.register({
        d = { name = 'Debugger' },
        f = { name = 'Finder' },
        g = { name = 'Git' },
        l = { name = 'Lsp' },
        m = { name = 'Harpoon' },
        n = { name = 'Notifications' },
        p = { name = 'Lazy' },
        t = { name = 'Tests' },
        u = { name = 'Edgy' },
        x = { name = 'Trouble' },
        ['w'] = 'which_key_ignore',
        ['q'] = 'which_key_ignore',
      }, { prefix = '<leader>' })
    end,
  },
}
