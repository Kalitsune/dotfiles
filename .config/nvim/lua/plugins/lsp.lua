local plugins = {
	{
		"williamboman/mason.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"ts_ls",
				"svelte",
				"cssls",
				"tailwindcss",
			},
			automatic_installation = true,
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
}
return plugins
