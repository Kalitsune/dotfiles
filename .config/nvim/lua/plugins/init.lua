local plugins = {
	{
		"andweeb/presence.nvim",
		opts = {
			show_time = false,
			main_image = "file",
		},
		lazy = false,
	},
	{
		"wakatime/vim-wakatime",
        event = "BufEnter",
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
    {
        "tpope/vim-surround",
        event = "BufEnter",
    },
}
return plugins
