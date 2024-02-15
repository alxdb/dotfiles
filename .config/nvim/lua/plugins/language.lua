return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    init = function(_)
      local lsp_zero = require("lsp-zero")
      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)
    end,
  },
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "jsonls", "rust_analyzer" },
    },
    config = function(_, opts)
      local lsp_zero = require("lsp-zero")

      opts = vim.tbl_deep_extend("force", opts, {
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            require("neodev").setup()
            require("lspconfig").lua_ls.setup({})
          end
        },
      })
      require("mason-lspconfig").setup(opts)
    end,
  },
  {
    "mrded/nvim-lsp-notify",
    dependencies = { "rcarriga/nvim-notify" },
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    main = "nvim-treesitter.configs",
    opts = {
      auto_install = true,
      highlight = { enable = true },
    },
  }
}
