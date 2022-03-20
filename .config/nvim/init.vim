filetype plugin indent on
syntax on

lua require("general")
lua require("plugs")
lua require("keybindings")
lua require("ui")
lua require("lsp")
lua require("treesitter")
lua require("terminal")

lua require("plugins.fzf")
lua require("plugins.gitsigns")
lua require("plugins.autopairs")
lua require("plugins.better_whitespace")
lua require("plugins.trouble")
lua require("plugins.neogen")
lua require("plugins.lightspeed_config")

" sandwhich

runtime macros/sandwich/keymap/surround.vim
