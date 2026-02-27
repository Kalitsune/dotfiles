return {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		js = { "prettier" },
		ts = { "prettier" },
		typst = { "typstyle" },
		java = { "clang-format" },
		c = { "clang-format" },
		make = { "mbake" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}
