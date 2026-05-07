local M = {}

local function setup()
  if os.getenv('THEME') then
    return os.getenv('THEME')
  end

  if vim.g.colors_name then
    return vim.g.colors_name
  end

  return 'rose-pine'
end

M.setup = setup

return M
