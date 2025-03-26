local nvlsp = require("nvchad.configs.lspconfig")
local lspconfig = require("lspconfig")

nvlsp.defaults() -- loads nvchad's defaults

local servers = {
	html = {},
	cssls = {},
	csharp_ls = {},
}

for name, opts in pairs(servers) do
	opts.on_init = nvlsp.on_init
	opts.on_attach = nvlsp.on_attach
	opts.capabilities = nvlsp.capabilities

	lspconfig[name].setup(opts)
end
