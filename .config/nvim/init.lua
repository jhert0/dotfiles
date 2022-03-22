-- TODO: figure out if this is really needed, i was having issues with
-- packer when this was removed
vim.cmd([[
    filetype plugin indent on
    syntax on
]])

require("general")
require("plugs")
require("keybindings")
require("ui")
require("lsp")
require("treesitter")
require("terminal")

require("plugins.fzf")
require("plugins.gitsigns")
require("plugins.autopairs")
require("plugins.better_whitespace")
require("plugins.trouble")
require("plugins.neogen")
require("plugins.lightspeed_config")
require("plugins.diffview_config")
require("plugins.neogit_config")
