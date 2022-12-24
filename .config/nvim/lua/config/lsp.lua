local lsp = require('lsp-zero')
local lsp_format = require('lsp-format')
local lsp_signature = require('lsp_signature')

lsp_format.setup()
lsp_signature.setup()

lsp.preset('recommended')
lsp.set_preferences({
    set_lsp_keymaps = false
})

lsp.on_attach(function(client, bufnr)
    lsp_format.on_attach(client)

    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.diagnostic.open_float({ focusable = false })')
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = false
})
