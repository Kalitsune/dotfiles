function toggleZenMode() 
    require("zen-mode").toggle({
        window = {
            width = .85 -- width will be 85% of the editor width
        }
    })
end

return {
    {
		"folke/twilight.nvim",
	},
	{
		"folke/zen-mode.nvim",
        keys = {
            {"<leader>zm", toggleZenMode, desc = "☯  Toggle ZenMode" }
        }
	},
}
