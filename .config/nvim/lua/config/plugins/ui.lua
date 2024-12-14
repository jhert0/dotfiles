return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            local lualine = require('lualine')

            lualine.setup({
                options = {
                    icons_enabled = false,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
            })
        end,
    },

    'nvim-tree/nvim-web-devicons',

    {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false,
                show_end_of_buffer = true,
                term_colors = true,
                dim_inactive = {
                    enabled = false,
                },
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    loops = { "italic" },
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = { "bold" },
                    operators = {},
                },
                color_overrides = {
                    mocha = {
                        base = "#181818",
                        mantle = "#181818",
                        crust = "#181818",
                    },
                },
                custom_highlights = function(colors)
                    return {
                        VertSplit = { fg = colors.overlay0 },
                        WinSeparator = { fg = colors.overlay0 },
                    }
                end,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    treesitter = true,
                },
            })

            -- setup must be called before loading
            vim.cmd.colorscheme "catppuccin"
        end
    },

    {
        "elihunter173/dirbuf.nvim",
        config = function()
            require("dirbuf").setup {
                hash_padding = 2,
                show_hidden = true,
            }
        end
    },
}
