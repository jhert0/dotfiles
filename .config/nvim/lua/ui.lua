vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.env.NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

local nightfox = require('nightfox')

nightfox.setup({
    options = {
        transparent = false,
        styles = {
            comments = "italic",
            functions = "italic",
            keywords = "NONE",
            numbers = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
        },
    },
    palletes = {
        duskfox = {
            bg0 = "#010101",
            bg1 = "#000000",
            bg3 = "#232323",
            comment = "#c9136c",
        },
    },
    specs = {
        duskfox = {
            syntax = {
                number = "orange.bright",
            },
        },
    },
    groups = {
        gitcommitSummary = { fg = 'pallet.white', link = '' },
        MatchParen = { fg = "yellow" },
        GitSignsChange = { fg = "yellow" },
        LineNr = { fg = "${fg2}" },
    },
})

vim.cmd([[colorscheme duskfox]])

require('lualine').setup({
    options = {
        theme = 'jellybeans',
    }
})

vim.cmd([[
    function! SynGroup()
        let l:s = synID(line('.'), col('.'), 1)
        echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    endfun
]])
