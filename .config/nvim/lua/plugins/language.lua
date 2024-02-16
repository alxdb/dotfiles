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
        lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
        lsp_zero.buffer_autoformat()
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
      ensure_installed = { "lua_ls", "jsonls", "rust_analyzer", "pylsp" },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(
        vim.tbl_deep_extend("force", opts, {
          handlers = {
            require("lsp-zero").default_setup,

            lua_ls = function()
              require("neodev").setup()
              require("lspconfig").lua_ls.setup({})
            end,

            pylsp = function()
              require("lspconfig").pylsp.setup({
                plugins = {
                  ruff = { enabled = true },
                  pylsp_mypy = { enabled = true },
                }
              })
            end,
          }
        })
      )
    end,
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
  },
}
