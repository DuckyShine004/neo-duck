local telescope = require "telescope"

telescope.setup {
  defaults = {
    file_ignore_patterns = { ".git/" },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
      follow = true,
    },
    git_files = { show_untracked = true },
  },
  -- extensions = {
  --   media_files = {
  --     filetypes = { "png", "jpg", "jpeg", "webp", "pdf" },
  --     find_cmd = "fd",
  --   },
  -- },
}

-- pcall(telescope.load_extension, "media_files")
