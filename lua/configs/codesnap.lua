local options = {
  show_line_number = true,
  show_workspace = true,

  snapshot_config = {
    theme = "candy",

    code_config = {
      font_family = "JetBrainsMono Nerd Font",
      breadcrumbs = {
        enable = true,
        separator = "/",
        -- color = "#80848b",
        font_family = "JetBrainsMono Nerd Font",
      },
    },

    watermark = {
      content = "duckyshine",
      font_family = "JetBrainsMono Nerd Font",
      -- color = "#ffffff",
    },
  },

  save_path = (os.getenv "XDG_PICTURES_DIR") or (os.getenv "HOME" .. "/Pictures"),
}

return options
