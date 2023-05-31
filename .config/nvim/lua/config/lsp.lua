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

    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)

    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)

    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)

    vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.diagnostic.open_float({ focusable = false })')
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = false
})
