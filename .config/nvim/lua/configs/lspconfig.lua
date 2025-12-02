require("nvchad.configs.lspconfig").defaults()

local servers = { 
    "html", "cssls", "clangd", "ts_ls", 
    "tailwindcss", "svelte",
    "lua_ls", "arduino_language_server", 
    "rust_analyser", "gopls"
}
vim.lsp.enable(servers)

-- to configure lsps further read :h vim.lsp.config

