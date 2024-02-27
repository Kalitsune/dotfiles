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
        "typescript-language-server",
        "svelte-language-server"
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "windwp/nvim-ts-autotag" },
    },
    opts = {
      ensure_installed = {
        "svelte",
        "javascript",
        "typescript",
        "html",
        "css"
      },
      auto_install = true,
      autotag = { enable = true }
    }
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
