require "nvchad.options"

-- o.cursorlineopt ='both' -- to enable cursorline!
local o = vim.o
local wo = vim.wo
local opt = vim.opt
local cmd = vim.cmd

o.clipboard = "unnamed,unnamedplus"
o.completeopt = "noinsert,menuone,noselect"
o.ttimeoutlen = 0
o.hidden = true
o.swapfile = false
o.encoding = "utf-8"
o.mouse = "a"
o.winborder = "single"

-- Indent
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
o.smarttab = true

o.showmode = false
o.autoread = true

-- Folding
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = true
o.foldlevel = 99
o.foldlevelstart = 99
o.foldnestmax = 1

-- Window defaults
wo.number = true
wo.relativenumber = true
wo.cursorline = true

-- UI
opt.guicursor = "n-v-i-c:block-Cursor"
opt.termguicolors = true

-- Characters
opt.fillchars = { eob = " " }
opt.wrap = false

cmd "filetype plugin indent on"
cmd "syntax on"
