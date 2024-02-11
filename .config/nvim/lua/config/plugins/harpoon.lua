return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require('harpoon')

        harpoon.setup()

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
        vim.keymap.set("n", "<leader>ho", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end)

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

        vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
    end
}
