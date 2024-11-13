local wezterm = require "wezterm"

-- Use wezterm.log_info to print out a message
wezterm.log_info("Loading wezterm.lua configuration...")

-- Will hold the configuration
local config = wezterm.config_builder()

-- Get the path separator from Lua's package.config (first character is the separator)
local sep = package.config:sub(1, 1)
local config_dir = wezterm.config_dir
local image_path = config_dir .. sep .. 'images' .. sep .. 'img3.jpg'
wezterm.log_info("Background image path: " .. image_path)


-- ui settings
config.color_scheme = 'Mountain'
-- config.window_background_image = image_path
config.window_background_opacity = 0.8
config.text_background_opacity = 0.8
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_close_confirmation = "NeverPrompt"
-- config.integrated_title_button_style = "Gnome"

config.font = wezterm.font("InconsolataGo Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" })
config.font_size = 14


-- keybinds
config.keys = { { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' }, }
config.keys = { { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom 'PrimarySelection' }, }

-- open WSL Debian on startup
config.wsl_domains = {
  {
    name = 'WSL:Debian',
    distribution = 'Debian',
    username = "tecu",
    default_cwd = "/home/tecu/"
  },
}

config.default_domain = 'WSL:Debian'

config.enable_scroll_bar = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 50
config.hide_tab_bar_if_only_one_tab = true


return config
