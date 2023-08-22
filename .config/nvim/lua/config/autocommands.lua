-- rocket
local auto = vim.api.nvim_create_autocmd

-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/autocommands.lua
auto({ 'FileType' }, {
  pattern = {
    'qf',
    'trouble',
    'help',
    'Jaq',
    'man',
    'spectre_panel',
    'MarkDown',
    'neo-tree',
    'vim',
    'toggleterm',
    'httpResult',
  },
  callback = function()
    vim.cmd([[
          nnoremap <silent> <buffer> q :close<cr>
          nnoremap <silent> <buffer> <esc> :close<cr>
          nnoremap <silent> <buffer> <c-q> :close<cr>
          set nobuflisted
        ]])
  end,
})

auto({ 'FileType' }, {
  pattern = {
    'TelescopePrompt',
  },
  callback = function()
    vim.cmd([[
          nnoremap <silent> <buffer> q :close!<cr>
          nnoremap <silent> <buffer> <esc> :close!<cr>
          nnoremap <silent> <buffer> <c-q> :close!<cr>
          set nobuflisted
        ]])
  end,
})

auto({ 'BufEnter' }, {
  pattern = { 'term://*' },
  callback = function()
    vim.cmd('startinsert!')
    vim.cmd('set cmdheight=1')
  end,
})

auto({ 'FileType' }, {
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    -- vim.opt_local.spell = true
  end,
})

-- autosave
auto({ 'FocusLost', 'BufLeave', 'VimLeave' }, {
  pattern = { ',' },
  callback = function()
    -- write - which then triggers
    -- formatting
    vim.cmd('silent! w')
  end,
})

-- auto({ 'BufRead' }, {
--   pattern = { '*' },
--   callback = function()
--     local line = '' .. vim.fn.getline(1)
--     local search = string.find(line, 'ft=swayconfig')
--     if search ~= nil then
--       vim.bo.filetype = 'swayconfig'
--     end
--   end,
-- })
