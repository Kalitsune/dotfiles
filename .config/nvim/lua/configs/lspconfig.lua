require("nvchad.configs.lspconfig").defaults()

local servers = {
	html = {}, -- html
	bashls = {}, -- bash
	cssls = {}, -- css
	clangd = {}, -- C / C++
	ts_ls = {}, -- typescript
	tailwindcss = {}, -- tailwind
	svelte = {}, -- sveltekit
	lua_ls = {}, -- lua
	arduino_language_server = {}, -- arduino
	rust_analyser = {}, -- rust
	jdtls = {}, -- java
	gopls = {}, -- golang
	tinymist = {}, -- typst
}

for name, opts in pairs(servers) do
	vim.lsp.config(name, opts)
	vim.lsp.enable(name)
end
