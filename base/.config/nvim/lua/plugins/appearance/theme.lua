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
}
