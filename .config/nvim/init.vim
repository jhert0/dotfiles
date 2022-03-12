filetype off
call plug#begin('~/.config/nvim/bundle')

" general

Plug 'tpope/vim-commentary'
Plug 'tmsvg/pear-tree'
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'markonm/traces.vim'
Plug 'machakann/vim-sandwich'
Plug 'jremmen/vim-ripgrep'
Plug 'justinmk/vim-sneak'
Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-rsi'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" theming

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'joshdick/onedark.vim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" snippets

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" writing

Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" git

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" fun

Plug 'koron/nyancat-vim'

call plug#end()

filetype plugin indent on
syntax on

" general

set mouse=a
set noshowmode
set background=dark
set ruler
set nocompatible
set autoread
set number
set relativenumber
set nowrap
set cursorline
set noerrorbells
set novisualbell
set title
set splitright
set splitbelow
set backspace=indent,eol,start
set lazyredraw
set hidden
set pastetoggle=<F10>
set timeoutlen=500
set updatetime=300
set autochdir
set eol
set clipboard=unnamed
set signcolumn=yes
set fsync
set listchars=tab:»\ ,trail:.,extends:>,precedes:<,nbsp:·
set list

set formatoptions-=t

set guifont=Iosevka:12
set undofile
set textwidth=72

" completion

set complete-=i
set wildmode=list:longest,list:full
set wildignorecase
set wildignore=*.swp,*.bak,*.pyc,*.class,*.png,*.jpg,*.gif,*.o,.git,.svn,.hg

" encoding

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" indentation

set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

" searching

set incsearch
set ignorecase
set hlsearch
set showmatch

if (executable("rg"))
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" theme

if (has("termguicolors"))
    set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

colorscheme onedark

let mapleader="\<space>"
let maplocalleader="\<space>m"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup filetype_detect_on_rename
    autocmd!
    autocmd BufFilePost * filetype detect
augroup END

" better-whitespace

let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

" sandwhich

runtime macros/sandwich/keymap/surround.vim

" vimtex

let g:tex_flavor="latex"
let g:vimtex_view_method="zathura"
let g:vimtex_compiler_method="latexmk"
let g:vimtex_compiler_progname="nvr"

" markdown

let g:vim_markdown_folding_disabled = 1

" pear-tree

let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" vim-sneak

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" mappings

nmap <silent> <leader><space> <cmd>Telescope commands<cr>

nmap <leader>gg :Gstatus<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gl :Glog<cr>

nmap <leader>bb <cmd>Telescope buffers<cr>
nmap <leader>bk :bdelete<cr>

nmap <leader>ff <cmd>Telescope find_files<cr>
nmap <leader>fr <cmd>Telescope oldfiles<cr>
nmap <leader>fi :e ~/.config/nvim/init.vim<cr>

nmap <leader>wh <C-w>h
nmap <leader>wj <C-w>j
nmap <leader>wk <C-w>k
nmap <leader>wl <C-w>l
nmap <silent> <leader>wv :vsplit<cr>
nmap <silent> <leader>ws :split<cr>
nmap <leader>w0 <C-w>o
nmap <leader>wo <C-w>w
nmap <leader>w1 <C-w>q
nmap <leader>wc <C-w>q
nmap <leader>wq <C-w>q

nmap <leader>/ :Rg

nmap <silent> <leader>ot :Term<cr>

" Useful abbreviations

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qa! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa

" terminal

autocmd TermOpen * if &buftype == 'terminal' | call TerminalCommands() | endif
autocmd TermOpen term://* startinsert
function TerminalCommands()
    set nonumber
    set signcolumn=no
endfunction

autocmd BufWritePre *.go lua vim.lsp.buf.formatting()

" lua files

lua require("general")
lua require("lsp")
lua require("treesitter")
