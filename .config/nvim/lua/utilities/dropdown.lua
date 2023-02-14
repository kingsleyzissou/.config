local M = {}

local function dropdown(title)
  local themes = require('telescope.themes')
  return themes.get_dropdown({
    previewer = false,
    initial_mode = 'normal',
    prompt_title = title,
  })
end

local function marks()
  require('telescope').extensions.harpoon.marks(dropdown('Marks'))
end

M.marks = marks

local function buffers()
  require('telescope.builtin').buffers(dropdown('Buffers'))
end

M.buffers = buffers

return M
