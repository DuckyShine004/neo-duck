require "nvchad.autocmds"

local function auto_group(name, opts)
  return vim.api.nvim_create_augroup(name, opts)
end

local function auto_command(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end

local groups = {
  file_type_group = auto_group("FileTypeGroup", { clear = true }),
  loading_group = auto_group("LoadingGroup", { clear = true }),
  focus_group = auto_group("FocusGroup", { clear = true }),
}

local function set_opts(shiftwidth, tabstop, softtabstop)
  vim.opt_local.shiftwidth = shiftwidth
  vim.opt_local.tabstop = tabstop
  vim.opt_local.softtabstop = softtabstop
end

auto_command({ "FocusGained", "BufEnter" }, {
  group = groups.focus_group,
  pattern = "*",
  callback = function()
    vim.cmd "checktime"
  end,
})

auto_command("FileType", {
  group = groups.file_type_group,
  pattern = "dbout",
  callback = function()
    vim.wo.foldenable = false
  end,
})

auto_command("FileType", {
  group = groups.file_type_group,
  pattern = { "html", "css", "lua", "json", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    set_opts(2, 2, 2)
  end,
})

auto_command("FileType", {
  group = groups.file_type_group,
  pattern = { "python" },
  callback = function()
    set_opts(4, 4, 4)
  end,
})

auto_command({ "BufRead", "BufNewFile" }, {
  group = groups.file_type_group,
  pattern = { "*.vert", "*.frag", "*.geom", "*.comp", "*.tesc", "*.tese" },
  callback = function()
    vim.bo.filetype = "glsl"
  end,
})
