require("nvchad.configs.lspconfig").defaults()

local servers = {
	html = {},
	bashls = {},
	cssls = {},
	clangd = {},
	ts_ls = {},
	tailwindcss = {},
	svelte = {},
	lua_ls = {},
	arduino_language_server = {},
	rust_analyser = {},
	gopls = {},
	tinymist = {},
}

for name, opts in pairs(servers) do
	vim.lsp.config(name, opts)
	vim.lsp.enable(name)
end
