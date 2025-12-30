local plugin = {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		lazy = false,
	},
	{
		"folke/twilight.nvim",
	},
	{
		"folke/zen-mode.nvim",
	},
    {
        'sindrets/diffview.nvim',
        keys = {
            {"<leader>gd", "<cmd>DiffviewOpen<cr>", desc = " Show git diff"},
        }
    },
}
return plugin
