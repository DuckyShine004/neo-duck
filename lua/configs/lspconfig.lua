local base = require "nvchad.configs.lspconfig"

base.defaults()

-- local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)

local lspconfig = require "lspconfig"

local function on_attach(client, bufnr)
  -- keep signature help enabled
  base.on_attach(client, bufnr)
end

local capabilities = base.capabilities

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.cmake.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
