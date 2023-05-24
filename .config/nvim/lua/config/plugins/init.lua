local packer = require('packer')

return packer.startup(function()
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    -- general
    use 'tpope/vim-commentary'
    use {
        'ntpeters/vim-better-whitespace',
        config = function()
            vim.g.better_whitespace_enabled = true
            vim.g.strip_whitespace_on_save = true
            vim.g.strip_whitespace_confirm = false
        end
    }
    use 'markonm/traces.vim'
    use 'justinmk/vim-sneak'
    use 'vimlab/split-term.vim'
    use 'tpope/vim-rsi'
    use 'editorconfig/editorconfig-vim'
    use {
        'ibhagwan/fzf-lua',
        branch = 'main',
        config = function()
            local fzf = require('fzf-lua')
            fzf.setup({
                winopts = {
                    split = 'belowright new',
                    preview = {
                        hidden = 'hidden'
                    }
                }
            })
        end
    }
    use {
        'ggandor/lightspeed.nvim',
        config = function()
            local lightspeed = require('lightspeed')
            lightspeed.setup({})
        end
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({
                key_labels = {
                    ["<space>"] = "SPC",
                    ["<cr>"] = "RET"
                }
            })
        end
    }
    use {
        "elihunter173/dirbuf.nvim",
        config = function()
            require("dirbuf").setup {
                hash_padding = 2,
                show_hidden = true,
            }
        end
    }

    -- programming
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "cpp", "python", "go", "c_sharp", "lua", "vim" },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true
                }
            }
        end
    }
    use 'machakann/vim-sandwich'
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            local indent_blankline = require('indent_blankline')

            indent_blankline.setup({
                show_end_of_line = true,
            })
        end
    }
    use {
        'danymat/neogen',
        config = function()
            local neogen = require('neogen')
            neogen.setup({
                snippet_engine = 'luasnip',
                input_after_comment = true,
                languages = {
                    csharp = {
                        template = {
                            annotation_convention = 'xmldoc'
                        }
                    }
                }
            })
        end
    }
    use 'RRethy/nvim-align'
    use {
        "olexsmir/gopher.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    }

    -- theming
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'jellybeans',
                }
            })
        end
    }
    use 'kyazdani42/nvim-web-devicons'
    use 'EdenEast/nightfox.nvim'
    use {
        'tiagovla/tokyodark.nvim',
        config = function()
            vim.g.tokyodark_enable_italic = false
            vim.cmd("colorscheme tokyodark")
        end
    }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use 'lukas-reineke/lsp-format.nvim'
    use 'ray-x/lsp_signature.nvim'
    use {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup()
        end
    }

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use { 'tpope/vim-fugitive' }
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            local diffview = require('diffview')
            diffview.setup({})
        end
    }
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
