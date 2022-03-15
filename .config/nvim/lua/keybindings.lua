vim.g.mapleader = ' '
vim.g.localmapleader = ' m'

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader><space>', '<cmd>Telescope commands<cr>', { silent = true })

-- buffers

map('n', '<leader>bb', '<cmd>Telescope buffers<cr>', { silent = true })
map('n', '<leader>bk', ':bdelete<cr>', { silent = true })

-- code

map('n', '<leader>cx', ':TroubleToggle<cr>')

-- files

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { silent = true })
map('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { silent = true })
map('n', '<leader>fi', ':e ~/.config/nvim/init.vim<cr>', { silent = true })

-- git

map('n', '<leader>gg', ':Git<cr>')
map('n', '<leader>gb', ':Git blame<cr>')
map('n', '<leader>gd', ':Git diff<cr>')
map('n', '<leader>gl', ':Git log<cr>')

-- windows

map('n', '<leader>wh', '<C-w>h')
map('n', '<leader>wj', '<C-w>j')
map('n', '<leader>wk', '<C-w>k')
map('n', '<leader>wl', '<C-w>l')

map('n', '<leader>wv', ':vsplit<cr>', { silent = true })
map('n', '<leader>ws', ':split<cr>', { silent = true })

map('n', '<leader>w0', '<C-w>o')
map('n', '<leader>wo', '<C-w>w')
map('n', '<leader>w1', '<C-w>q')
map('n', '<leader>wc', '<C-w>q')

-- open

map('n', '<leader>ot', ':Term<cr>', { silent = true })

-- toggle

map('n', '<leader>tf', ':FormatToggle<cr>')

-- other

map('n', '<leader>/', ':Rg ')
