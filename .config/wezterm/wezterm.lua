local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.colors = {
    cursor_bg = '#adadad',
    cursor_fg = 'black',
    cursor_border = '#adadad',
}

config.font = wezterm.font 'Iosevka'

config.use_fancy_tab_bar = false

config.window_background_opacity = 0.80

config.enable_scroll_bar = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

return config
