local plugins = {
	{
		"williamboman/mason.nvim",
	},
    {
      "neovim/nvim-lspconfig",
       config = function()
          require "configs.lspconfig"
       end,
    },
}
return plugins
