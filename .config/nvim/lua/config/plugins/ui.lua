return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            -- Eviline config for lualine
            -- Author: shadmansaleh
            -- Credit: glepnir
            local lualine = require('lualine')

            -- Color table for highlights
            -- stylua: ignore
            local colors = {
                bg       = '#111111',
                fg       = '#bbc2cf',
                yellow   = '#ECBE7B',
                cyan     = '#008080',
                darkblue = '#081633',
                green    = '#98be65',
                orange   = '#FF8800',
                violet   = '#a9a1e1',
                magenta  = '#c678dd',
                blue     = '#51afef',
                red      = '#ec5f67',
            }

            local conditions = {
                buffer_not_empty = function()
                    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
                end,
                hide_in_width = function()
                    return vim.fn.winwidth(0) > 80
                end,
                check_git_workspace = function()
                    local filepath = vim.fn.expand('%:p:h')
                    local gitdir = vim.fn.finddir('.git', filepath .. ';')
                    return gitdir and #gitdir > 0 and #gitdir < #filepath
                end,
            }

            -- Config
            local config = {
                options = {
                    -- Disable sections and component separators
                    component_separators = '',
                    section_separators = '',
                    theme = {
                        -- We are going to use lualine_c an lualine_x as left and
                        -- right section. Both are highlighted by c theme .  So we
                        -- are just setting default looks o statusline
                        normal = {
                            a = { fg = colors.fg, bg = colors.bg },
                            b = { fg = colors.fg, bg = colors.bg },
                            c = { fg = colors.fg, bg = colors.bg }
                        },
                        inactive = {
                            a = { fg = colors.fg, bg = colors.bg },
                            b = { fg = colors.fg, bg = colors.bg },
                            c = { fg = colors.fg, bg = colors.bg }
                        },
                    },
                },
                sections = {
                    -- these are to remove the defaults
                    lualine_a = {},
                    lualine_b = {},
                    lualine_y = {},
                    lualine_z = {},
                    -- These will be filled later
                    lualine_c = {},
                    lualine_x = {},
                },
                inactive_sections = {
                    -- these are to remove the defaults
                    lualine_a = {},
                    lualine_b = {},
                    lualine_y = {},
                    lualine_z = {},
                    lualine_c = {},
                    lualine_x = {},
                },
            }

            -- Inserts a component in lualine_c at left section
            local function ins_left(component)
                table.insert(config.sections.lualine_c, component)
                table.insert(config.inactive_sections.lualine_c, component)
            end

            -- Inserts a component in lualine_x at right section
            local function ins_right(component)
                table.insert(config.sections.lualine_x, component)
                table.insert(config.inactive_sections.lualine_x, component)
            end

            ins_left {
                function()
                    return '▊'
                end,
                color = { fg = colors.blue },      -- Sets highlighting of component
                padding = { left = 0, right = 1 }, -- We don't need space before this
            }

            ins_left {
                -- mode component
                function()
                    local mode = vim.fn.mode()

                    if mode == 'n' or mode == 'nt' or mode == 'nT' or mode == 'niI' or mode == 'niR' or mode == 'niV' then
                        return '<N>'
                    elseif mode == 'no' then
                        return '<O>'
                    elseif mode == 'i' or mode == 'ic' or mode == 'ix' then
                        return '<I>'
                    elseif mode == 'v' or mode == 'V' or mode == 'vs' or mode == 'Vs' then
                        return '<V>'
                    elseif mode == 't' then
                        return '<T>'
                    elseif mode == 'R' or mode == 'Rc' or mode == 'Rx' or mode == 'Rvc' or mode == 'Rvx' then
                        return '<R>'
                    elseif mode == 'c' or mode == 'cv' then
                        return '<C>'
                    end

                    return ''
                end,
                color = function()
                    -- auto change color according to neovims mode
                    local mode_color = {
                        n = colors.red,
                        i = colors.green,
                        v = colors.blue,
                        ['␖'] = colors.blue,
                        V = colors.blue,
                        c = colors.magenta,
                        no = colors.red,
                        s = colors.orange,
                        S = colors.orange,
                        ['␓'] = colors.orange,
                        ic = colors.yellow,
                        R = colors.violet,
                        Rv = colors.violet,
                        cv = colors.red,
                        ce = colors.red,
                        r = colors.cyan,
                        rm = colors.cyan,
                        ['r?'] = colors.cyan,
                        ['!'] = colors.red,
                        t = colors.red,
                    }
                    return { fg = mode_color[vim.fn.mode()] }
                end,
                padding = { right = 1 },
            }

            ins_left {
                -- filesize component
                'filesize',
                cond = conditions.buffer_not_empty,
            }

            ins_left {
                'filename',
                cond = conditions.buffer_not_empty,
                color = { fg = colors.magenta, gui = 'bold' },
            }

            ins_left { 'location' }

            ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

            ins_left {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                    color_error = { fg = colors.red },
                    color_warn = { fg = colors.yellow },
                    color_info = { fg = colors.cyan },
                },
            }

            -- Insert mid section. You can make any number of sections in neovim :)
            -- for lualine it's any number greater then 2
            ins_left {
                function()
                    return '%='
                end,
            }

            -- Add components to right sections
            ins_right {
                'o:encoding',
                fmt = string.upper,
                cond = conditions.hide_in_width,
                color = { fg = colors.green, gui = 'bold' },
            }

            ins_right {
                'fileformat',
                fmt = string.upper,
                icons_enabled = false,
                color = { fg = colors.green, gui = 'bold' },
            }

            ins_right {
                'branch',
                icon = '',
                color = { fg = colors.violet, gui = 'bold' },
            }

            ins_right {
                'diff',
                -- Is it me or the symbol for modified us really weird
                symbols = { added = '+', modified = '~', removed = '-' },
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.orange },
                    removed = { fg = colors.red },
                },
                cond = conditions.hide_in_width,
            }

            -- Now don't forget to initialize lualine
            lualine.setup(config)
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
