local config = function()
  return {
    install = {
      colorscheme = { require('theme.lazyvim').setup() },
    },
    change_detection = {
      notify = false,
    },
  }
end

require('lazy').setup('plugins', config())
