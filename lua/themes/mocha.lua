local M = {}

M.base_30 = {
  white = "#CDD6F4",
  darker_black = "#11111B",
  black = "#181825", -- default bg
  black2 = "#252434",
  one_bg = "#313244", -- real bg of onedark
  one_bg2 = "#45475A",
  one_bg3 = "#585B70",
  grey = "#474656",
  grey_fg = "#4e4d5d",
  grey_fg2 = "#555464",
  light_grey = "#605f6f",
  red = "#F38BA8",
  baby_pink = "#ffa5c3",
  pink = "#F5C2E7",
  line = "#383747", -- for lines like vertsplit
  green = "#A6E3A1",
  vibrant_green = "#b6f4be",
  nord_blue = "#8bc2f0",
  blue = "#89B4FA",
  yellow = "#F9E2AF",
  sun = "#ffe9b6",
  purple = "#d0a9e5",
  dark_purple = "#c7a0dc",
  teal = "#94e2d5",
  orange = "#FAB387",
  cyan = "#89DCEB",
  statusline_bg = "#232232",
  lightbg = "#2f2e3e",
  pmenu_bg = "#ABE9B3",
  folder_bg = "#89B4FA",
  lavender = "#b4befe",
}

M.base_16 = {
  base00 = "#181825", -- default bg
  base01 = "#11111B", -- dark bg
  base02 = "#313244", -- selection bg
  base03 = "#45475A", -- comments
  base04 = "#585B70", -- dark fg
  base05 = "#CDD6F4", -- default fg, text
  base06 = "#F5E0DC", -- light fg, brackets, commas
  base07 = "#B4BEFE", -- light bg
  base08 = "#F38BA8", -- red: variables, errors
  base09 = "#FAB387", -- orange: numbers, booleans
  base0A = "#F9E2AF", -- yellow: classes, search, warnings
  base0B = "#A6E3A1", -- green: strings
  base0C = "#94E2D5", -- cyan: support, regex
  base0D = "#89B4FA", -- blue: functions, methods
  base0E = "#CBA6F7", -- purple: keywords, operators
  base0F = "#F2CDCD", -- brown: deprecated
}

M.polish_hl = {
  treesitter = {
    ["@variable"] = { fg = M.base_30.lavender },
    ["@property"] = { fg = M.base_30.teal },
    ["@variable.builtin"] = { fg = M.base_30.red },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "mocha")

return M
