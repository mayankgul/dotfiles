local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.term = "xterm-256color"

config.harfbuzz_features = {
	"calt",
	"liga",
}

config.color_scheme = "Gruvbox Material (Gogh)"

config.default_prog = {
	"/bin/zsh",
	"-l",
}

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.84,
}

config.max_fps = 120

config.animation_fps = 120

config.front_end = "WebGpu"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 24

config.line_height = 1.15

config.cell_width = 1.0

config.use_fancy_tab_bar = false

config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "NONE"

config.window_close_confirmation = "NeverPrompt"

config.adjust_window_size_when_changing_font_size = false

config.default_cursor_style = "SteadyBlock"

config.window_background_opacity = 0.75

config.macos_window_background_blur = 40

config.audible_bell = "Disabled"

config.native_macos_fullscreen_mode = true

config.scrollback_lines = 50000

config.hyperlink_rules = wezterm.default_hyperlink_rules()

config.window_padding = {
	left = 12,
	right = 12,
	top = 14,
	bottom = 8,
}

config.enable_kitty_graphics = true

return config
