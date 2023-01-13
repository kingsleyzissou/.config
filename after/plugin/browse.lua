local browse = require('browse')

local bookmarks = {
    'https://github.com/osbuild/osbuild-composer',
    'https://github.com/osbuild/osbuild',
    'https://github.com/osbuild/image-builder',
    'https://mail.redhat.com',
    'https://chat.redhat.com',
    'https://calendar.redhat.com',
}

local function command(name, rhs, opts)
    opts = opts or {}
    vim.api.nvim_create_user_command(name, rhs, opts)
end

command('BrowseInputSearch', function()
    browse.input_search()
end, {})

command('Browse', function()
    browse.browse({ bookmarks = bookmarks })
end, {})

command('BrowseBookmarks', function()
    browse.open_bookmarks({ bookmarks = bookmarks })
end, {})
