local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#181818"

config.color_schemes = {
    ["Catppuccin Custom"] = custom,
}

config.color_scheme = 'Catppuccin Custom'
config.font = wezterm.font 'Iosevka'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.95

config.enable_scroll_bar = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.initial_rows = 24
config.initial_cols = 100

return config
