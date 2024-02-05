return {
    {
        'leoluz/nvim-dap-go',
        config = function()
            local dap_go = require('dap-go')
            dap_go.setup()
        end
    },

    {
        "olexsmir/gopher.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
}
