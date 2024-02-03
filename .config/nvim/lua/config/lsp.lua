local lsp = require('lsp-zero')
local lsp_format = require('lsp-format')
local lsp_signature = require('lsp_signature')
local navic = require('nvim-navic')

lsp_format.setup()
lsp_signature.setup({})

lsp.on_attach(function(client, bufnr)
    lsp_format.on_attach(client, bufnr)

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    lsp.default_keymaps({ buffer = bufnr })

    vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.diagnostic.open_float({ focusable = false })')
end)


vim.diagnostic.config({
    virtual_text = false
})
