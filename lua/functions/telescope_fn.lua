local telescope = require "telescope.builtin"

local M = {}

M.INCLUDE_SYMBOLS = {
  "Class",
  "Constant",
  "Function",
  "Method",
  "Interface",
  "Module",
  "Struct",
  "Enum",
  "Constructor",
  "TypeParameter",
  "Event",
  "Operator",
  "Namespace",
  "Package",
}

function M.buffer_diagnostics()
  telescope.diagnostics { bufnr = 0 }
end

function M.document_symbols(opts)
  opts = opts or {}
  opts.symbols = opts.symbols or M.INCLUDE_SYMBOLS
  telescope.lsp_document_symbols(opts)
end

function M.dynamic_workspace_symbols(opts)
  opts = opts or {}
  opts.symbols = opts.symbols or M.INCLUDE_SYMBOLS
  telescope.lsp_dynamic_workspace_symbols(opts)
end

return M
