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

vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("omnisharp", {
  on_init = on_init,
  -- on_attach = function(client, bufnr)
  --   if client.server_capabilities.semanticTokensProvider and client.server_capabilities.semanticTokensProvider.full then
  --     client.server_capabilities.semanticTokensProvider = {
  --       full = true,
  --       range = true,
  --       legend = { tokenTypes = {}, tokenModifiers = {} },
  --     }
  --   end
  --   on_attach(client, bufnr)
  -- end,
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

vim.lsp.enable { "clangd", "cmake", "pyright", "omnisharp" }
