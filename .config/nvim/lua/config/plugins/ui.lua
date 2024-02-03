return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup()
        end,
    },

    'kyazdani42/nvim-web-devicons',

    {
        "catppuccin/nvim", as = "catppuccin",
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
                        base = "#000000",
                        mantle = "#000000",
                        crust = "#000000",
                    },
                },
                custom_highlights = {},
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
