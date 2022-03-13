local telescope = require('telescope')

telescope.setup({
    defaults = {
        layouts_strategy = 'center',
    },
    pickers = {
        find_files = {
            previewer = false,
            theme = "dropdown",
        },
        buffers = {
            previewer = false,
            theme = "dropdown",
        },
        git_files = {
            previewer = false,
            theme = "dropown"
        },
        git_branches = {
            previewer = false,
            theme = "dropdown",
        },
        command_history = {
            theme = "dropdown",
        }
    },
})
