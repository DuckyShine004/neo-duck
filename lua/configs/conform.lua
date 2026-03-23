local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang_format" },
    python = { "docformatter", "black" },
    cmake = { "cmake_format" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    -- glsl = { "prettier" },
    toml = { "taplo" },
    zsh = { "shfmt" },
    sh = { "shfmt" },
    cs = { "csharpier" },
    json = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    tex = { "latexindent" },
    plaintex = { "latexindent" },
    bib = { "latexindent" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
