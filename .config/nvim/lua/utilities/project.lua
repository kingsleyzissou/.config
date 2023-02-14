local M = {}

M.getName = function()
  local cwd = vim.fn.getcwd()
  local project_dir = vim.split(cwd, '/')
  local length = #project_dir
  local project_name = project_dir[length]
  if project_dir[length - 1] == '.config' then
    project_name = project_name .. ' (config)'
  end
  return project_name
end

return M
