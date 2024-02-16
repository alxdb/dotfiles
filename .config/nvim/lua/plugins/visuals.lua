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
    "folke/noice.nvim",
    event = "VeryLazy",
    config = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      yadm = { enable = true },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
  }
}
