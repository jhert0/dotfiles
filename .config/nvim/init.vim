filetype off
call plug#begin('~/.config/nvim/bundle')

" general

Plug 'tpope/vim-commentary'
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
Plug 'windwp/nvim-autopairs'

" theming

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'joshdick/onedark.vim'

" LSP

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'lukas-reineke/lsp-format.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/trouble.nvim'

" autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" snippets

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" git

Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" fun

Plug 'koron/nyancat-vim'

call plug#end()

filetype plugin indent on
syntax on

lua require("general")
lua require("keybindings")
lua require("ui")
lua require("lsp")
lua require("treesitter")

lua require("plugins.telescope")
lua require("plugins.gitsigns")
lua require("plugins.autopairs")
lua require("plugins.better_whitespace")
lua require("plugins.trouble")

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup filetype_detect_on_rename
    autocmd!
    autocmd BufFilePost * filetype detect
augroup END

" sandwhich

runtime macros/sandwich/keymap/surround.vim

" vim-sneak

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

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
