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
        schedule(telescope[action])
    end
end
