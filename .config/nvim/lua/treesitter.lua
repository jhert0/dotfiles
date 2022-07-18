require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "python", "go", "c_sharp", "lua", "vim" },
  auto_install = true,
  highlight = {
    additional_vim_regex_highlighting = false,
  },
}

