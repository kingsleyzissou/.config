-- ensure packer is installed
local bootstrap = require('config.bootstrap')
bootstrap.setup()

-- packer
vim.keymap.set('n', '<leader>pi', require('packer').install, { desc = 'Packer Install' })
vim.keymap.set('n', '<leader>pc', require('packer').clean, { desc = 'Packer Clean' })
vim.keymap.set('n', '<leader>ps', require('packer').sync, { desc = 'Packer Sync' })
vim.keymap.set('n', '<leader>pu', require('packer').update, { desc = 'Packer Update' })

return require('packer').startup(function()
  -- Packer plugin manager
  use('wbthomason/packer.nvim')

  -- color schemes
  use('ntk148v/vim-horizon')
  use('folke/tokyonight.nvim')
  use('catppuccin/nvim')
  use('xiyaowong/nvim-transparent')

  -- highlighting
  use('RRethy/vim-illuminate')

  -- Some vim utilities
  use('folke/neodev.nvim')
  use('nvim-lua/plenary.nvim')
  use('tami5/sqlite.lua')
  use('tpope/vim-commentary')
  use('tpope/vim-endwise')
  use('kylechui/nvim-surround')
  use('windwp/nvim-autopairs')
  use('folke/zen-mode.nvim')
  use('folke/which-key.nvim')
  use('kikito/inspect.lua') -- I think this is a dependency
  use('monaqa/dial.nvim')
  use('gaborvecsei/memento.nvim')
  use('is0n/jaq-nvim')
  use('AndrewRadev/sideways.vim')

  -- telescope
  use('nvim-telescope/telescope.nvim')
  use('nvim-telescope/telescope-symbols.nvim')
  use('nvim-telescope/telescope-frecency.nvim')
  use('ThePrimeagen/harpoon')

  -- trouble
  use('folke/trouble.nvim')
  use('folke/todo-comments.nvim')

  -- caching
  use('lewis6991/impatient.nvim')

  -- notify
  use('rcarriga/nvim-notify')
  use('MunifTanjim/nui.nvim')
  use('folke/noice.nvim')

  -- git plugins
  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')
  use('kdheepak/lazygit.nvim')

  -- treesitter
  use('nvim-treesitter/nvim-treesitter')

  -- icons
  use('kyazdani42/nvim-web-devicons')

  -- nvim tree
  use('kyazdani42/nvim-tree.lua')

  -- vim-go
  use({
    'fatih/vim-go',
    run = ':GoUpdateBinaries',
  })

  -- lualine
  use('nvim-lualine/lualine.nvim')

  -- undo tree
  use('mbbill/undotree')

  -- -- lsp stuff
  use('neovim/nvim-lspconfig')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('jose-elias-alvarez/null-ls.nvim')
  use('onsails/lspkind-nvim')
  use('simrat39/symbols-outline.nvim')

  -- progress tracker for lsp server
  use('j-hui/fidget.nvim')

  --completion
  use('christianchiarulli/nvim-cmp')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-emoji')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')
  use('saadparwaiz1/cmp_luasnip')
  use('github/copilot.vim')
  use({
    'tzachar/cmp-tabnine',
    run = './install.sh',
  })

  -- session
  use('tpope/vim-obsession')
  use('dhruvasagar/vim-prosession')

  -- snippets
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')

  -- formatting
  use('mhartington/formatter.nvim')

  -- folds
  use('kevinhwang91/promise-async')
  use('kevinhwang91/nvim-ufo')

  -- toggle term
  use('akinsho/toggleterm.nvim')

  -- markdown
  use('ellisonleao/glow.nvim') -- keep this because opens in nvim
  use('iamcco/markdown-preview.nvim')

  -- browse
  use('lalitmee/browse.nvim')

  -- windowing
  use('moll/vim-bbye')

  -- rest
  use('rest-nvim/rest.nvim')
end)
