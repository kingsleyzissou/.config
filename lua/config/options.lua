vim.opt.encoding = 'utf8'

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.opt.number = true -- set numbers
vim.opt.numberwidth = 4 -- set number width
vim.opt.relativenumber = true -- set relative number lines
vim.opt.ignorecase = true -- case insensitive
vim.opt.hlsearch = false -- highlight search
vim.opt.incsearch = true -- incremental search
vim.opt.cursorline = true -- highlight the current line
vim.opt.cmdheight = 1 -- set more height for the terminal

-- set whitespace char values
vim.opt.listchars = {
  eol = '↵',
  space = '•',
  tab = '»•',
  trail = '~',
}
vim.opt.list = true -- show whitespace

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true -- use smart indent
vim.opt.wildmode = 'longest:full,full' -- tab completions
vim.opt.ttyfast = true -- fast scrolling
vim.opt.swapfile = false -- disable swap file
vim.opt.backup = false -- disable backup
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.signcolumn = 'yes' -- set the sign column permanently

-- color support
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- fold settings
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.g.mapleader = ' '

vim.g.Illuminate_ftblacklist = { 'alpha', 'NvimTree', 'harpoon' }
