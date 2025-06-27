return {
  {
    -- auto-pairs
    'windwp/nvim-autopairs',
    event = 'VeryLazy',
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
    -- color code inlays
    'brenoprata10/nvim-highlight-colors',
    opts = {
      render = 'virtual',
    },
  },

  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },

  {
    'szw/vim-maximizer',
    event = 'VeryLazy',
    keys = {
      { '<leader>sm', '<cmd>MaximizerToggle<cr>', desc = 'Mimimize/Maximize split' },
      { '<leader>sv', '<cmd>vsplit<cr>', desc = 'Vertical split' },
      { '<leader>sh', '<cmd>hsplit<cr>', desc = 'Horizontal split' },
      --resize
      { '<leader>sj', '<cmd>resize -2<cr>', desc = 'Increase bottom split' },
      { '<leader>sk', '<cmd>resize +2<cr>', desc = 'Increase top split' },
      { '<leader>sh', '<cmd>vertical resize -2<cr>', desc = 'Increase right split' },
      { '<leader>sl', '<cmd>vertical resize +2<cr>', desc = 'Increase left split' },
    },
  },

  {
    -- add comments
    'tpope/vim-commentary',
    lazy = false,
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
    event = 'VeryLazy',
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
    -- which-key
    'folke/which-key.nvim',
    event = 'VeryLazy',
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
      icons = {
        mappings = false,
      },
    },
    config = function()
      local wk = require('which-key')
      wk.add({
        { '<leader>c', group = 'Terminal' },
        { '<leader>f', group = 'Finder' },
        { '<leader>g', group = 'Git' },
        { '<leader>l', group = 'Diagnostics' },
        { '<leader>m', group = 'Harpoon' },
        { '<leader>p', group = 'Lazy' },
        { '<leader>s', group = 'Splits' },
        { '<leader>t', group = 'Tests' },
        { '<leader>x', group = 'Trouble' },
        { '<leader>-', hidden = true },
        { '<leader>.', hidden = true },
        { '<leader>,', hidden = true },
        { '<leader>w', hidden = true },
        { '<leader>q', hidden = true },
        { '<leader>j', hidden = true },
        { '<leader>k', hidden = true },
      })
    end,
  },
}
