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
    'LazyGit',
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

-- Close annoying buffers
auto({ 'QuitPre', 'ExitPre' }, {
  pattern = { ',' },
  callback = function()
    vim.cmd('silent! TroubleClose')
    vim.cmd('silent! lua require("dapui").close()')
  end,
})

auto({ 'WinEnter', 'BufEnter' }, {
  callback = function()
    if vim.bo.buftype == 'terminal' then
      return
    end

    vim.schedule(require('codewindow').open_minimap)
  end,
})
