local if_nil = vim.F.if_nil

local alpha = require "alpha"

local duck = {
  "                                            ██████████                                  ",
  "                                      ░░  ██░░░░░░░░░░██                                ",
  "                                        ██░░░░░░░░░░░░░░██                              ",
  "                                        ██░░░░░░░░████░░██████████                      ",
  "                            ██          ██░░░░░░░░████░░██▒▒▒▒▒▒██                      ",
  "                          ██░░██        ██░░░░░░░░░░░░░░██▒▒▒▒▒▒██                      ",
  "                          ██░░░░██      ██░░░░░░░░░░░░░░████████                        ",
  "                        ██░░░░░░░░██      ██░░░░░░░░░░░░██                              ",
  "                        ██░░░░░░░░████████████░░░░░░░░██                                ",
  "                        ██░░░░░░░░██░░░░░░░░░░░░░░░░░░░░██                              ",
  "                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                            ",
  "                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                            ",
  "                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                            ",
  "                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                            ",
  "                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                            ",
  "                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                              ",
  "                          ██░░░░░░░░░░░░░░░░░░░░░░░░░░██                                ",
  "                            ██████░░░░░░░░░░░░░░░░████                                  ",
  "                                  ████████████████                                      ",
}

local header = {
  type = "text",
  val = duck,
  opts = {
    position = "center",
    hl = "Type",
  },
}

local datefn = io.popen 'echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"'
local date = datefn:read "*a"
datefn:close()

local closing = {
  type = "text",
  val = "└──────────────────────────┘",
  opts = {
    position = "center",
    hl = "AlphaHeader",
  },
}

local heading = {
  type = "text",
  val = "┌─   Today is " .. date .. " ─┐",
  opts = {
    position = "center",
    hl = "AlphaHeader",
  },
}

local footer = {
  type = "text",
  val = "-quack-",
  opts = {
    position = "center",
    hl = "Number",
  },
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 3,
    width = 26,
    align_shortcut = "right",
    hl_shortcut = "Keyword",
  }
  if keybind then
    keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
  end

  return {
    type = "button",
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    button("e", "󰝒  New file", ":ene <BAR> startinsert <CR>"),
    button("SPC f f", "󰭎  Find file", ":Telescope find_files<CR>"),
    button("SPC f r", "󰑓  Recent", ":Telescope oldfiles<CR>"),
    -- button("SPC f w", "󰃁  Workspaces", ":Telescope workspaces<CR>"),
    button("q", "󰩈  Quit", ":qa<CR>"),
  },
  opts = {
    spacing = 1,
  },
}

local section = {
  header = header,
  buttons = buttons,
  closing = closing,
  heading = heading,
  footer = footer,
}

local opts = {
  layout = {
    { type = "padding", val = 2 },
    section.header,
    { type = "padding", val = 1 },
    section.heading,
    section.closing,
    { type = "padding", val = 1 },
    section.buttons,
    { type = "padding", val = 1 },
    section.footer,
  },
  opts = {
    margin = 5,
  },
}

alpha.setup(opts)

require("base46").compile()
require("base46").load_all_highlights()
