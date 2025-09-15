local options = {
  bg_theme = "dusk",
  watermark = "duckyshine",
  code_font_family = "JetBrainsMono Nerd Font",
  save_path = os.getenv "XDG_PICTURES_DIR" or (os.getenv "HOME" .. "/Pictures"),
}

return options
