local trouble = require('trouble')
local view = require('nvim-tree.view')
local telescope = require('telescope.builtin')

local function schedule(callback)
  vim.schedule(function()
    callback()
  end)
end

return function(action)
  return function()
    if view.is_visible() then
      view.close()
    end
    trouble.close()
    schedule(telescope[action])
  end
end
