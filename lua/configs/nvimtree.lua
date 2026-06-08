vim.api.nvim_set_hl(0, "NvimTreeRootFolder", {
  fg = "#89B4FA",
  bg = "#313244",
  italic = true,
  bold = true,
})

local options = {
  filters = { dotfiles = false, git_ignored = false },
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    width = 30,
    preserve_window_proportions = true,
  },
  renderer = {
    root_folder_label = function(path)
      return "  " .. vim.fn.fnamemodify(path, ":t")
    end,
    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
      glyphs = {
        default = "󰈚",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
        },
        git = { unmerged = "" },
      },
    },
  },
  filesystem_watchers = { enable = true, debounce_delay = 50 },
}

return options
