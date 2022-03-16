local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        layouts_strategy = 'center',
        mappings = {
            i = {
                ["<esc>"] = actions.close
            }
        }
    },
    pickers = {
        find_files = {
            previewer = false,
            theme = "ivy",
        },
        buffers = {
            previewer = false,
            theme = "ivy",
        },
        git_files = {
            previewer = false,
            theme = "ivy"
        },
        git_branches = {
            previewer = false,
            theme = "ivy",
        },
        commands = {
            previewer = false,
            theme = "ivy"
        },
        command_history = {
            theme = "ivy",
        }
    },
})
