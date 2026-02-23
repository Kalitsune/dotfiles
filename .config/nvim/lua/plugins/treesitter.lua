return {
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
				"markdown",
				"markdown_inline",
			},
			auto_install = true,
            highlight = { enable = true },
			autotag = { enable = true },
		},
	},
}
