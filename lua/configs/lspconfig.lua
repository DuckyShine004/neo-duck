local base = require "nvchad.configs.lspconfig"

base.defaults()

local on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local function on_attach(client, bufnr)
  base.on_attach(client, bufnr)
end

local capabilities = base.capabilities

local omni_command = vim.fn.exepath "OmniSharp"

local pid = vim.fn.getpid()

vim.lsp.config("clangd", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("cmake", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("glsl_analyzer", {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("jsonls", {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("jdtls", {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("omnisharp", {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { omni_command, "--languageserver", "--hostPID", tostring(pid) },

  -- Other omnisharp options
  enable_editorconfig_support = true,
  enable_ms_build_load_projects_on_demand = true,
  organize_imports_on_format = true,
  enable_roslyn_analyzers = true,
  enable_import_completion = true,
  analyze_open_documents_only = false,
})

vim.lsp.config("texlab", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = false,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "%p", "--synctex-forward", "%l:1:%f" },
      },
      chktex = { onOpenAndSave = true },
      latexFormatter = "latexindent",
      latexindent = { modifyLineBreaks = true },
    },
  },
})

vim.lsp.config("ltex", {
  cmd = { "ltex-ls-plus" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ltex = {
      language = "en-NZ",
      additionalRules = { enablePickyRules = true },
      disabledRules = { ["en"] = { "MORFOLOGIK_RULE_EN_AU" } },
      checkFrequency = "edit",
      completionEnabled = true,
    },
  },
})

vim.lsp.enable { "clangd", "cmake", "pyright", "omnisharp", "glsl_analyzer", "jsonls" }
