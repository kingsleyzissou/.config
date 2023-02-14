local trouble = require('trouble')

trouble.setup({
  position = 'bottom',
  use_diagnostic_signs = false,
})

local function trouble_action(mode)
  return function()
    trouble.toggle({
      opts = {
        mode = mode,
      },
    })
  end
end

-- keybindings
local map = vim.keymap.set
map('n', '<leader>xx', trouble_action(), { desc = 'Toggle trouble' })
map('n', '<leader>xl', trouble_action('loclist'), { desc = 'Location list' })
map('n', '<leader>xq', trouble_action('quickfix'), { desc = 'Quickfix' })
map('n', '<leader>xj', '<cmd>cprev<cr>', { desc = 'Prev quickfix' })
map('n', '<leader>xk', '<cmd>cnext<cr>', { desc = 'Next quickfix' })
map('n', '<leader>xt', '<cmd>TodoTrouble<cr>', { desc = 'Todos' })
map('n', '<leader>xd', trouble_action('document_diagnostics'), { desc = 'Document diagnostics' })
map('n', '<leader>xw', trouble_action('workspace_diagnostics'), { desc = 'Workspace diagnostics' })
