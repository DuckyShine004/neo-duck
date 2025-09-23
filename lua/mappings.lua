require "nvchad.mappings"

local telescope = require "telescope.builtin"

local plugin_fn = require "functions.plugin_fn"
local toggle_fn = require "functions.toggle_fn"

local telescope_fn = require "functions.telescope_fn"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Lazy plugins
map("n", "<leader>ls", plugin_fn.sync_all_plugins, { desc = "Plugins sync" })
map("n", "<leader>la", plugin_fn.load_all_plugins, { desc = "Plugins load" })

-- File
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "File save" })
map({ "n", "i", "v" }, "<C-q>", "<cmd>q<cr>", { desc = "File close" })
map("i", "<C-H>", "<C-w>", { desc = "Delete previous word in insert mode" })

-- Tree
map("n", "<leader>op", ":NvimTreeToggle<cr>", { desc = "Toggle file tree" })

-- Text
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("v", "[", ">gv", { desc = "Indent" })
map("v", "]", "<gv", { desc = "Unindent" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Shift selected text up" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Shift selected text down" })

-- Window
map("n", "<leader>hs", "<cmd>split<cr>", { desc = "Window split horizontal" })
map("n", "<leader>vs", "<cmd>vsplit<cr>", { desc = "Window split vertical" })
map("n", "<C-Left>", "<cmd>vertical resize +2<CR>", { desc = "Window resize left" })
map("n", "<C-Right>", "<cmd>vertical resize -2<CR>", { desc = "Window resize right" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Window resize down" })
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Window resize up" })

-- Transparency
map("n", "<leader>tt", toggle_fn.toggle_transparency, { desc = "Toggle transparency" })

-- Telescope
map("n", "<leader>fr", telescope.lsp_references, { desc = "Telescope find all references" })
map("n", "<leader>fd", telescope.diagnostics, { desc = "Telescope find project diagnostics" })
map("n", "<leader>fD", telescope_fn.buffer_diagnostics, { desc = "Telescope find buffer diagnostics" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Telescope search todo list" })

-- Trouble
map("n", "<leader>td", "<cmd>Trouble diagnostics toggle focus=true<cr>", { desc = "Trouble project diagnostics" })
map("n", "<leader>tD", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>", { desc = "Trouble buffer diagnostics" })
map("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=true win.position=right<cr>", { desc = "Trouble project symbols" })
map("n", "<leader>tl", "<cmd>Trouble lsp toggle focus=true win.position=right<cr>", { desc = "Trouble LSP symbol and tag tree" })
map("n", "<leader>tL", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble location list" })
map("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble quick fix list" })
map("n", "<leader>tT", "<cmd>Trouble todo toggle focus=true win.position=right<cr>", { desc = "Trouble todo list" })

-- LazyGit
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit load LazyGit" })

-- Neovim signature help
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.keymap.set({ "i", "n" }, "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "LSP signature help" })
  end,
})

-- Markdown Preview
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown preview markdown file live" })

-- Code Snapshot
map({ "x" }, "<leader>cc", ":'<,'>CodeSnap<cr>", { desc = "Save selected code snapshot into clipboard" })
map({ "x" }, "<leader>cs", ":'<,'>CodeSnapSave<cr>", { desc = "Save selected code snapshot in ~/Pictures" })

-- LSP
-- map("n", "<leader>")
