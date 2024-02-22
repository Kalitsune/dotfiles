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
    'github/copilot.vim'
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
      ensure_installed = {
        "eslint-lsp",
        "typescript-language-server"
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require('custom.configs.lint')
    end
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    'rcarriga/nvim-notify',
    lazy = false
  }
}
return plugins
