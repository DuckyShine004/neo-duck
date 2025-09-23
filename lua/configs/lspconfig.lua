local base = require "nvchad.configs.lspconfig"

base.defaults()

local function on_attach(client, bufnr)
  base.on_attach(client, bufnr)
end

local capabilities = base.capabilities

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

vim.lsp.enable { "clangd", "cmake", "pyright" }
