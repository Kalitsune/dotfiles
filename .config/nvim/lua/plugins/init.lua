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
    'wakatime/vim-wakatime', 
    lazy = false
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ts_ls",
        "svelte",
        "cssls",
        "tailwindcss" 
      },
      automatic_installation = true
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "configs.lspconfig"
    end
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
      require 'configs.lint'
    end
  },
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    config = function()
      require "configs.conform"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    'rcarriga/nvim-notify',
    lazy = false
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
  }
}
return plugins

