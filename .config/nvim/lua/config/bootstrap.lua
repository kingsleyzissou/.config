-- Thanks to:
-- https://github.com/wbthomason/packer.nvim/issues/53#issuecomment-774832854
local notify = require('notify')

local M = {}

local send_notification = function(code)
  if code == 0 then
    notify('[packer]: Installed successfully')
    vim.cmd([[packadd packer.nvim]])
    return
  end
  notify('[packer]: Installation failed', 'error')
end

M.setup = function()
  -- Bootstrap `packer` installation to manage packages
  local packer = {
    path = '~/.local/share/nvim/site/pack/packer/start/packer.nvim',
    url = 'https://github.com/wbthomason/packer.nvim',
  }

  if vim.fn.executable('git') ~= 1 then
    notify('[packer] Bootstrap failed, git not installed', 'error')
    return
  end

  if vim.fn.empty(vim.fn.glob(packer.path)) > 0 then
    notify('[packer]: Installing...')

    local handle
    handle = vim.loop.spawn(
      'git',
      {
        args = {
          'clone',
          packer.url,
          packer.path,
        },
      },
      vim.schedule_wrap(function(code, _)
        send_notification(code)
        handle:close()
      end)
    )
  end
end

return M
