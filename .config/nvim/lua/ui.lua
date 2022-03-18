vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.env.NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

local nightfox = require('nightfox')

nightfox.setup({
    options = {
        styles = {
            comments = "italic",
            functions = "italic",
            keywords = "NONE",
            numbers = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
        }
    }
})

vim.cmd([[colorscheme nordfox]])

require('lualine').setup()
