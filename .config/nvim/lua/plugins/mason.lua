return {
	{
		"mason-org/mason.nvim",
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = require("configs.mason"),
		cmd = { "MasonToolsInstall", "MasonToolsClean" },
	},
}
