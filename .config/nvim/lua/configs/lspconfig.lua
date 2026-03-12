require("nvchad.configs.lspconfig").defaults()

local servers = {
	"html", -- html
	"bashls", -- bash
	"cssls", -- css
	"clangd", -- C / C++
	"ts_ls", -- typescript
	"tailwindcss", -- tailwind
	"svelte", -- sveltekit
	"lua_ls", -- lua
	"arduino_language_server", -- arduino
	"rust_analyser", -- rust
	"jdtls", -- java
	"gopls", -- golang
	"tinymist", -- typst
	"just-lsp", -- just build system
	"qmlls", -- QML markup language (used by quickshell)
}

-- use vim.lsp.config(name, opts) for extra setings

vim.lsp.config("qmlls", { cmd = { "qmlls", "-E" } })

-- Enable the servers
vim.lsp.enable(servers)
