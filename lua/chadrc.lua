-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_dark",
  -- transparency = true,
}

-- M.nvdash = {
--   load_on_startup = true,
-- }

-- theme: ~
-- |values| = default, vscode, vscode_colored, minimal

-- separator_style: ~
-- |values| = default, round, block, arrow
-- Note: the style wont work for vscode themes

M.ui = {
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
}

-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
