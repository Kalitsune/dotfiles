local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- Example config:
-- lspconfig.rust_analyser.setup({
--  on_attach = on_attach,
--  capabilities = capabilities,
--  filetypes = { 'rust' },
--  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
-- })
--

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)}
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
  --     disableSuggestions = true,
    }
  },
  commands = {
    organizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}

-- configless servers
local servers = { "html", "cssls", "svelte"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
