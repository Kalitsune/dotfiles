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
		lazy = false,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
}
return plugins
