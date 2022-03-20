vim.cmd([[
    autocmd TermOpen * if &buftype == 'terminal' | call TerminalCommands() | endif
    autocmd TermOpen term://* startinsert
    function TerminalCommands()
        setlocal nonumber
        setlocal norelativenumber
        setlocal signcolumn=no
    endfunction
]])
