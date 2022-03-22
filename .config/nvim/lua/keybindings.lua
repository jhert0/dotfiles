vim.g.mapleader = ' '
vim.g.localmapleader = ' m'

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader><space>', '<cmd>FzfLua commands<cr>', { silent = true })

-- buffers

map('n', '<leader>bb', '<cmd>FzfLua buffers<cr>', { silent = true })
map('n', '<leader>bk', ':bdelete<cr>')
map('n', '<leader>br', ':e!<cr>')
map('n', '<leader>bn', ':bnext<cr>', { silent = true })
map('n', '<leader>bp', ':bprevious<cr>', { silent = true })
map('n', '<leader>bx', ':15split<cr>', { silent = true })

-- code

map('n', '<leader>cf', ':Format<cr>', { silent = true })
map('n', '<leader>cx', ':TroubleToggle<cr>', { silent = true })
map('n', '<leader>cd', ':Neogen<cr>')

-- files

map('n', '<leader>ff', '<cmd>FzfLua files<cr>', { silent = true })
map('n', '<leader>fr', '<cmd>FzfLua oldfiles<cr>', { silent = true })
map('n', '<leader>fi', ':e ~/.config/nvim/init.lua<cr>', { silent = true })

-- git

map('n', '<leader>gg', ':Neogit<cr>')
--map('n', '<leader>gb', ':Neogit blame<cr>')
map('n', '<leader>gr', ':Neogit branch<cr>')
map('n', '<leader>gd', ':Neogit diff<cr>')
map('n', '<leader>gl', ':Neogit log<cr>')

-- windows

map('n', '<leader>wh', '<C-w>h')
map('n', '<leader>wj', '<C-w>j')
map('n', '<leader>wk', '<C-w>k')
map('n', '<leader>wl', '<C-w>l')

map('n', '<leader>w>', '<C-w>>')
map('n', '<leader>w<', '<C-w><')

map('n', '<leader>wr', '<C-w>r')
map('n', '<leader>wR', '<C-w>R')

map('n', '<leader>wv', ':vsplit<cr>', { silent = true })
map('n', '<leader>ws', ':split<cr>', { silent = true })

map('n', '<leader>w0', '<C-w>o')
map('n', '<leader>wo', '<C-w>w')
map('n', '<leader>w1', '<C-w>q')
map('n', '<leader>wc', '<C-w>q')

map('n', '<leader>wt', '<C-w>t')
map('n', '<leader>wx', '<C-w>x')

-- open

map('n', '<leader>ot', ':Term<cr>', { silent = true })

-- toggle

map('n', '<leader>tf', ':FormatToggle<cr>')
map('n', '<leader>tw', ':set wrap!<cr>')
map('n', '<leader>ts', ':set spell!<cr>')
map('n', '<leader>tl', ':set list!<cr>')

-- other

map('n', '<leader>/', '<cmd>FzfLua live_grep<cr>')
map('n', '<leader>xx', ':source ~/.config/nvim/init.lua<cr>')
