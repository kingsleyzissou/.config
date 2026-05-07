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
    enable = false,
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
}
