local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang_format" },
    python = { "docformatter", "black" },
    cmake = { "cmake_format" },
    cs = { "csharpier" },
    rust = { "rustfmt" },

    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },

    json = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },

    toml = { "taplo" },
    zsh = { "shfmt" },
    sh = { "shfmt" },

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
