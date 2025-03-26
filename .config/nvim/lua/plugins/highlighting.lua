local plugin = {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "windwp/nvim-ts-autotag" },
		},
		opts = {
			ensure_installed = {
				"svelte",
				"javascript",
				"typescript",
				"html",
				"css",
			},
			auto_install = true,
			autotag = { enable = true },
		},
	},
}
return plugin
