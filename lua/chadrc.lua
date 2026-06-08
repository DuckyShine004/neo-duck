-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local function nvdash_time()
  return os.date("%I:%M %p"):gsub("^0", "")
end

local function nvdash_date()
  return os.date "%a %d %b"
end

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "mocha",
  transparency = true,
  hl_override = {
    NvDashAscii = {
      fg = "#f9e2af",
    },
    NvimTreeRootFolder = {
      fg = "#cba6f7",
      -- bg = "#cba6f7",
      italic = true,
      bold = true,
    },
  },
}

M.ui = {
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  tabufline = {
    enabled = false,
  },
}

M.nvdash = {
  load_on_startup = true,

  header = {
    "                    ██████████            ",
    "              ░░  ██░░░░░░░░░░██          ",
    "                ██░░░░░░░░░░░░░░██        ",
    "                ██░░░░░░░░████░░██████████",
    "    ██          ██░░░░░░░░████░░██▒▒▒▒▒▒██",
    "  ██░░██        ██░░░░░░░░░░░░░░██▒▒▒▒▒▒██",
    "  ██░░░░██      ██░░░░░░░░░░░░░░████████  ",
    "██░░░░░░░░██      ██░░░░░░░░░░░░██        ",
    "██░░░░░░░░████████████░░░░░░░░██          ",
    "██░░░░░░░░██░░░░░░░░░░░░░░░░░░░░██        ",
    "██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██      ",
    "██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██      ",
    "██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██      ",
    "██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██      ",
    "██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██      ",
    "██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██        ",
    "  ██░░░░░░░░░░░░░░░░░░░░░░░░░░██          ",
    "    ██████░░░░░░░░░░░░░░░░████            ",
    "          ████████████████                ",
    "",
  },

  buttons = {
    {
      txt = function()
        return "┌────────   Today is " .. nvdash_date() .. " ─────────┐"
      end,
      hl = "NvDashDate",
      no_gap = false,
      content = "fit",
    },

    { txt = "󰝒  New File", keys = "e", cmd = "ene | startinsert" },
    { txt = "󰭎  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "󰑓  Recent", keys = "fr", cmd = "Telescope oldfiles" },
    { txt = "󰩈  Quit", keys = "q", cmd = "qa" },

    {
      txt = function()
        return "└────────── 󰥔  Started " .. nvdash_time() .. " ──────────┘"
      end,
      hl = "NvDashDate",
      no_gap = false,
      content = "fit",
    },

    {
      txt = "-quack-",
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },
  },
}

return M
