local fzf = require('fzf-lua')

fzf.setup({
    winopts = {
        split = 'new',
        preview = {
            hidden = 'hidden'
        }
    }
})
