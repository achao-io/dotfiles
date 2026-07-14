local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- https://www.reddit.com/r/neovim/comments/v0f4ko/oc_catppuccin_the_lovely_pastel_theme_now_comes/
-- <leader>uC
-- config.color_scheme = "Catppuccin Latte"
-- config.color_scheme = "Catppuccin Frappe"
-- config.color_scheme = "Catppuccin Macchiato"
config.color_scheme = "Catppuccin Mocha"

config.window_background_opacity = 0.95
config.macos_window_background_blur = 95

config.font_size = 16
config.max_fps = 120
config.font = wezterm.font("DroidSansMono Nerd Font")

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_frame = {
	font = wezterm.font("DroidSansMono Nerd Font", { weight = "Bold" }),
}

-- More scrollback (default is 3500 lines)
config.scrollback_lines = 9999999

return config
