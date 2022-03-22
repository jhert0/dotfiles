local neogit = require("neogit")

neogit.setup({
    kind = "split",
    integrations = {
        diffview = true
    }
})
