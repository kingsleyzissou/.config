local M = {}

local function get_dirs(root)
  local dirs = {}
  local handle = vim.loop.fs_scandir(root)
  if not handle then
    return dirs
  end
  while true do
    local name, type = vim.loop.fs_scandir_next(handle)
    if not name then
      break
    end
    if type == 'directory' and name ~= '.git' then
      dirs[#dirs + 1] = {
        text = name,
        file = root .. '/' .. name,
      }
    end
  end
  table.sort(dirs, function(a, b)
    return a.text < b.text
  end)
  return dirs
end

function M.pick()
  local cwd = vim.fn.getcwd()
  local current_root = cwd

  Snacks.picker.pick({
    title = 'Directories',
    finder = function()
      return get_dirs(current_root)
    end,
    format = 'file',
    confirm = function(picker, item)
      picker:close()
      if item then
        Snacks.picker.grep({ dirs = { item.file } })
      end
    end,
    actions = {
      select = function(self, item)
        if item then
          current_root = item.file
          self:find()
        end
      end,
      back = function(self)
        local parent = vim.fn.fnamemodify(current_root, ':h')
        if parent ~= current_root then
          current_root = parent
          self:find()
        end
      end,
    },
    win = {
      input = {
        keys = {
          ['<Right>'] = { 'select', mode = { 'i', 'n' }, desc = 'Select' },
          ['<Left>'] = { 'back', mode = { 'i', 'n' }, desc = 'Go to parent' },
        },
      },
    },
  })
end

return M
