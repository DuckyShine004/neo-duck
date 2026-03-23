local lint = require "lint"

local function shader_stage_from_name(bufname)
  if bufname:match "%.vert$" then
    return "vert"
  end
  if bufname:match "%.frag$" then
    return "frag"
  end
  if bufname:match "%.geom$" then
    return "geom"
  end
  if bufname:match "%.comp$" then
    return "comp"
  end
  if bufname:match "%.tesc$" then
    return "tesc"
  end
  if bufname:match "%.tese$" then
    return "tese"
  end
  return nil
end

local function find_root(bufname)
  local markers = { ".git", "CMakeLists.txt", "compile_commands.json" }
  return vim.fs.root(bufname, markers) or vim.fn.getcwd()
end

lint.linters.glslangvalidator = function()
  local bufname = vim.api.nvim_buf_get_name(0)
  local root = find_root(bufname)
  local stage = shader_stage_from_name(bufname)

  local args = {
    "-I" .. root,
  }

  if stage then
    table.insert(args, "-l")
    table.insert(args, "-S")
    table.insert(args, stage)
  end

  table.insert(args, bufname)

  return {
    cmd = "glslangValidator",
    stdin = false,
    append_fname = false,
    args = args,
    stream = "both",
    ignore_exitcode = true,
    parser = function(output, bufnr)
      local diagnostics = {}

      for line in vim.gsplit(output, "\n", { plain = true, trimempty = true }) do
        local severity, _, lnum, message = line:match [[^(ERROR): ([^:]+):(%d+): (.+)$]]

        if not severity then
          severity, _, lnum, message = line:match [[^(WARNING): ([^:]+):(%d+): (.+)$]]
        end

        -- fallback for old-style output: ERROR: 0:10: ...
        if not severity then
          severity, _, lnum, message = line:match [[^(ERROR): (%d+):(%d+): (.+)$]]
        end

        if not severity then
          severity, _, lnum, message = line:match [[^(WARNING): (%d+):(%d+): (.+)$]]
        end

        if severity and lnum and message then
          table.insert(diagnostics, {
            lnum = tonumber(lnum) - 1,
            col = 0,
            message = message,
            severity = severity == "ERROR" and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN,
            source = "glslangValidator",
            bufnr = bufnr,
          })
        end
      end

      return diagnostics
    end,
  }
end

lint.linters_by_ft = {
  glsl = { "glslangvalidator" },
}
