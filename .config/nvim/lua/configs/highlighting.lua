local parsers = require("nvim-treesitter.parsers")
local ft_to_parser = parsers.filetype_to_parsername
if ft_to_parser == nil then
	ft_to_parser = {}
end
ft_to_parser.mdx = "markdown"
