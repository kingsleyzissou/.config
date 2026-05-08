-- rocket
local auto = vim.api.nvim_create_autocmd

auto({ 'FileType' }, {
  pattern = {
    'qf',
    'trouble',
    'help',
    'Jaq',
    'man',
    'MarkDown',
    'neo-tree',
    'vim',
    'snacks_lazygit',
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
    -- just for readability
    vim.opt_local.wrap = true
  end,
})

-- autosave
auto({ 'FocusLost', 'BufLeave', 'VimLeave' }, {
  pattern = { '*' },
  callback = function()
    -- write - which then triggers formatting
    vim.cmd('noautocmd silent! w')
  end,
})

-- Close annoying buffers
auto({ 'QuitPre', 'ExitPre' }, {
  pattern = { '*' },
  callback = function()
    -- this causes nvim to crashout,
    -- so we make sure to close it before exiting
    vim.cmd('silent! TroubleClose')
  end,
})

auto({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { 'Schutzfile' },
  command = 'setlocal filetype=json',
})
