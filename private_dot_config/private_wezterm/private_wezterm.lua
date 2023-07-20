-- Pull in the wezterm API
local wezterm = require 'wezterm'

function get_config()
  -- In newer versions of wezterm, use the config_builder which will
  -- help provide clearer error messages
  if wezterm.config_builder then
    return wezterm.config_builder()
  else
    return {}
  end
end

-- https://wezfurlong.org/wezterm/config/lua/wezterm.gui/get_appearance.html
function get_appearance()
  -- wezterm.gui is not available to the mux server, so take care to
  -- do something reasonable when this config is evaluated by the mux
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "GitHub Dark"
  else
    return "Github"
  end
end

-- This table will hold the configuration.
local config = get_config()

config.color_scheme = scheme_for_appearance(get_appearance())
config.font = wezterm.font 'FiraCode NF'
config.font_size = 11

config.default_prog = {
	'fish', '-i'
}

config.check_for_updates = false
config.hide_tab_bar_if_only_one_tab = true

return config
