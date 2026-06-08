return {
  -- {
  --   "goolord/alpha-nvim",
  --   event = "VimEnter",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require "configs.alpha"
  --   end,
  -- },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "folke/trouble.nvim",
    opts = require "configs.trouble",
  },

  {
    "folke/twilight.nvim",
    opts = require "configs.twilight",
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = require "configs.zen",
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = require "configs.nvimtree",
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "configs.gitsigns"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    opts = function(_, opts)
      require "configs.telescope"
      return opts
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/tree-sitter-norg", "nvim-neorg/tree-sitter-norg-meta" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      }
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    config = function()
      require "configs.linter"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "OXY2DEV/markview.nvim" },
    lazy = false,
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "cpp",
        "c",
      },
    },
  },

  {
    "danymat/neogen",
    config = true,
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 49,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "lervag/vimtex",
    ft = { "tex", "plaintex", "latex" },
    init = function()
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_quickfix_open_on_warning = 0

      if vim.loop.os_uname().sysname == "Linux" then
        vim.g.vimtex_view_method = "zathura"
      else
        vim.g.vimtex_view_method = "skim"
      end
    end,
  },

  {
    "3rd/image.nvim",
    event = "VeryLazy",
    opts = "configs.image",
  },

  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = require "configs.leetcode",
  },

  {
    "DuckyShine004/duck-type.nvim",
    opts = require "configs.ducktype",
  },

  {
    "mistricky/codesnap.nvim",
    opts = require "configs.codesnap",
  },
}
