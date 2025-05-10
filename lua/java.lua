local lspconfig = require("lspconfig")

lspconfig.jdtls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("pom.xml", ".git"),
  cmd = { "jdtls" },
  filetypes = { "java" },
}
