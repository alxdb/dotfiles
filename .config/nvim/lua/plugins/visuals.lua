return {
  {
    "Shatur/neovim-ayu",
    main = "ayu",
    opts = { mirage = true },
    init = function(_)
      require("ayu").colorscheme()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "Shatur/neovim-ayu" },
    opts = {
      sections = {
        lualine_x = { "filetype" },
        lualine_y = {},
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    main = "notify",
    opts = {
      render = "compact",
    },
    init = function(_)
      vim.notify = require("notify")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      yadm = { enable = true },
    }
  }
}
