local plugin = {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("configs.conform")
		end,
	},
}
return plugin
