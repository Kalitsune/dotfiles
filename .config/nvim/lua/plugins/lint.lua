local plugin = {
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			require("configs.lint")
		end,
	},
}
return plugin
