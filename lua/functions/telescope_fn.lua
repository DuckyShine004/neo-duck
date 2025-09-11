local telescope = require "telescope.builtin"

local M = {}

function M.buffer_diagnostics()
  telescope.diagnostics { bufnr = 0 }
end

return M
