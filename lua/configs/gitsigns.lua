local gitsigns = require "gitsigns"

local options = {
  watch_gitdir = {
    follow_files = true,
  },
}

gitsigns.setup(options)
