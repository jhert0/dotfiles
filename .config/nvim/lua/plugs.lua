local packer = require('packer')

return packer.startup(function()
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    -- general
    use 'tpope/vim-commentary'
    use 'ntpeters/vim-better-whitespace'
    use 'markonm/traces.vim'
    use 'justinmk/vim-sneak'
    use 'vimlab/split-term.vim'
    use 'tpope/vim-rsi'
    use 'editorconfig/editorconfig-vim'
    use { 'ibhagwan/fzf-lua', branch = 'main' }
    use 'ggandor/lightspeed.nvim'

    -- programming
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'machakann/vim-sandwich'
    use 'windwp/nvim-autopairs'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'danymat/neogen'
    use 'RRethy/nvim-align'

    -- theming
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'EdenEast/nightfox.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'lukas-reineke/lsp-format.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'folke/trouble.nvim'

    -- autocompletion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- snippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- git
    use 'lewis6991/gitsigns.nvim'
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'bobrown101/git_blame.nvim'

    -- fun
    use 'koron/nyancat-vim'
end)

--vim.cmd([[
--    augroup packer_user_config
--      autocmd!
--      autocmd BufWritePost plugs.lua source <afile> | PackerCompile
--    augroup end
--]])
