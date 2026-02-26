-- This file needs to have same structure as nvconfig.lua
-- https://github.com/nvchad/ui/blob/v2.5/lua/nvconfig.lua

vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets"

---@type ChadrcConfig
local Config = {
	base46 = {
		theme = "carbonfox",
		theme_toggle = { "carbonfox", "rosepine-dawn" },
	},
}
return Config
