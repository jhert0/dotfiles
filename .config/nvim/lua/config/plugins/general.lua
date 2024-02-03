return {
    'nvim-lua/plenary.nvim',

    'tpope/vim-commentary',

    {
        'ntpeters/vim-better-whitespace',
        config = function()
            vim.g.better_whitespace_enabled = true
            vim.g.strip_whitespace_on_save = true
            vim.g.strip_whitespace_confirm = false
        end
    },

    'markonm/traces.vim',
    'justinmk/vim-sneak',
    'vimlab/split-term.vim',
    'tpope/vim-rsi',

    {
        'ibhagwan/fzf-lua',
        branch = 'main',
        config = function()
            local fzf = require('fzf-lua')
            fzf.setup({
                winopts = {
                    split = 'belowright 15new',
                    preview = {
                        hidden = 'hidden'
                    }
                }
            })
        end
    },

    {
        'ggandor/lightspeed.nvim',
        config = function()
            local lightspeed = require('lightspeed')
            lightspeed.setup({})
        end
    },
}
