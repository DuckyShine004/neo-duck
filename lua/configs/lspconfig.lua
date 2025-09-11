local base = require "nvchad.configs.lspconfig"

base.defaults()

-- local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)

local lspconfig = require "lspconfig"

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = nil
    base.on_attach(client, bufnr)
  end,
  capabilities = base.capabilities,
}

lspconfig.cmake.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = nil
    base.on_attach(client, bufnr)
  end,
  capabilities = base.capabilities,
}

lspconfig.pyright.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = nil
    base.on_attach(client, bufnr)
  end,
  capabilities = base.capabilities,
  filetypes = { "python" },
}

-- read :h vim.lsp.config for changing options of lsp servers
