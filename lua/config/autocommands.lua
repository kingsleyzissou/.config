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
        'NvimTree',
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
    pattern = { '' },
    callback = function()
        local get_project_dir = function()
            local cwd = vim.fn.getcwd()
            local project_dir = vim.split(cwd, '/')
            local project_name = project_dir[#project_dir]
            return project_name
        end

        vim.opt.titlestring = get_project_dir()
    end,
})

auto({ 'BufEnter' }, {
    pattern = { 'term://*' },
    callback = function()
        vim.cmd('startinsert!')
        vim.cmd('set cmdheight=1')
    end,
})

-- auto({ 'BufEnter' })

auto({ 'FileType' }, {
    pattern = { 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

auto('User', {
    pattern = 'GitConflictDetected',
    callback = function()
        vim.notify('Conflict detected in ' .. vim.fn.expand('<afile>'))
        -- vim.keymap.set('n', 'cww', function()
        -- engage.conflict_buster()
        -- create_buffer_local_mappings()
        -- end)
    end,
})
