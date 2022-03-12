vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fsync = true
vim.opt.autochdir = true
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.clipboard = 'unnamed'
vim.opt.formatoptions:remove('t')

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'

--vim.opt.list = true
--vim.opt.listchars = { tab = '>', eol = '$', space = '.', trail = '.' }

-- ui

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.title = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true

-- text editing

vim.opt.wrap = false
vim.opt.textwidth = 72

-- indentation

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- completion

vim.opt.wildignorecase = true
vim.opt.wildignore = {
    '*.swp', '*.bak', '*.pyc', '*.class',
    '*.png', '*.jpg', '*.gif', '*.o',
    '.git', '.svn', '.hg'
}

-- searching

vim.opt.ignorecase = true
vim.opt.showmatch = true
