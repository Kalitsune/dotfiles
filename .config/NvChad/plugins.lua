local plugins = {
  {
    'andweeb/presence.nvim',
    opts = {
      show_time = false,
      main_image = 'file'
    },
    lazy = false
  },
  {
    'github/copilot.vim',
    lazy = false
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {},
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {},
      auto_install = true,
    }
  }
}
return plugins
