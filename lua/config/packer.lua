-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function()
    -- Packer plugin manager
    use('wbthomason/packer.nvim')

    -- Dashboard theme
    use('goolord/alpha-nvim')

    -- color schemes
    use('ntk148v/vim-horizon')
    use('folke/tokyonight.nvim')

    -- highlighting
    use('RRethy/vim-illuminate')
    use('rktjmp/highlight-current-n.nvim')

    -- Some vim utilities
    use('nvim-lua/plenary.nvim')
    use('tami5/sqlite.lua')
    use('tpope/vim-commentary')
    use('tpope/vim-endwise')
    use('kylechui/nvim-surround')
    use('justinmk/vim-sneak')
    use('windwp/nvim-autopairs')
    use('folke/zen-mode.nvim')
    use('folke/which-key.nvim')
    use('folke/todo-comments.nvim')
    use('kikito/inspect.lua')
    use('nvim-pack/nvim-spectre')
    use('monaqa/dial.nvim')
    use('gaborvecsei/memento.nvim')
    use('nacro90/numb.nvim')

    -- copy/cut/paste
    use('gbprod/yanky.nvim')

    -- telescope
    use('nvim-telescope/telescope.nvim')
    use('nvim-telescope/telescope-symbols.nvim')
    use('nvim-telescope/telescope-frecency.nvim')
    use('ThePrimeagen/harpoon')

    -- project & session
    use('ahmedkhalf/project.nvim')
    use('Pocco81/auto-save.nvim')
    use('rmagatti/auto-session')
    use({ 'rmagatti/session-lens', commit = '4c1754bf5c2372d0a6265d40fb8f713bc27c8018' })

    -- caching
    use('lewis6991/impatient.nvim')

    -- notify
    use('rcarriga/nvim-notify')

    -- git plugins
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')
    use('kdheepak/lazygit.nvim')
    use('akinsho/git-conflict.nvim')

    -- treesitter (you cant run from it)
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

    -- lsp stuff
    use('neovim/nvim-lspconfig')
    use('williamboman/nvim-lsp-installer')
    use('williamboman/mason.nvim')
    use('jose-elias-alvarez/null-ls.nvim')
    use('folke/trouble.nvim')
    use('simrat39/symbols-outline.nvim')
    use('onsails/lspkind-nvim')
    use('j-hui/fidget.nvim')

    -- completion
    use('christianchiarulli/nvim-cmp')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-emoji')
    use('hrsh7th/cmp-nvim-lua')
    use('saadparwaiz1/cmp_luasnip')
    -- use('github/copilot.vim')
    use({
        'tzachar/cmp-tabnine',
        run = './install.sh',
    })

    -- snippets
    use('L3MON4D3/LuaSnip')
    use('rafamadriz/friendly-snippets')

    -- toggle term
    use('akinsho/toggleterm.nvim')
    use('is0n/jaq-nvim')

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
