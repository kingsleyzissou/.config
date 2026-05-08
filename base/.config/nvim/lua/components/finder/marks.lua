local M = {}

function M.list()
  local harpoon = require('harpoon')
  local function get_items()
    local items = {}
    for idx, item in ipairs(harpoon:list().items) do
      items[#items + 1] = {
        text = item.value,
        file = item.value,
        idx = idx,
      }
    end
    return items
  end

  Snacks.picker.pick({
    title = 'Harpoon',
    finder = function() return get_items() end,
    format = 'file',
    confirm = function(picker, item)
      picker:close()
      if item then vim.cmd('edit ' .. item.file) end
    end,
    actions = {
      delete_mark = function(self, item)
        if item then
          harpoon:list():remove_at(item.idx)
          self:find()
        end
      end,
    },
    win = {
      input = {
        keys = {
          ['<c-x>'] = { 'delete_mark', mode = { 'i', 'n' }, desc = 'Delete mark' },
          ['<del>'] = { 'delete_mark', mode = { 'i', 'n' }, desc = 'Delete mark' },
        },
      },
    },
  })
end

return M
