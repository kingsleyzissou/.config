local theme = require('components.statusline.theme')
local M = {}

-- just re-export this for convenience
M.theme = theme.theme

M.sections = {
  lualine_b = {
    'branch',
    {
      function()
        local toplevel = vim.fn.system('git rev-parse --show-toplevel 2>/dev/null'):gsub('\n', '')
        local git_dir = vim.fn.system('git rev-parse --git-dir 2>/dev/null'):gsub('\n', '')
        -- If git-dir contains 'worktrees', we're in a worktree
        if git_dir:match('worktrees') then
          local worktree_name = vim.fn.fnamemodify(toplevel, ':t')
          return '⑂' .. ' ' .. worktree_name
        end
        return ''
      end,
      color = { fg = theme.colors.text },
    },
  },
  lualine_x = {
    function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then return '' end
      return clients[1].name
    end,
  },
  lualine_y = {
    'filetype',
    {
      color = { fg = theme.colors.text },
    },
  },
}

return M
