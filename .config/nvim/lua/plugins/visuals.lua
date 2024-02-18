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
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>ff",
        function() require("telescope.builtin").find_files() end,
        desc = "Telescope (find) Files",
      },
      {
        "<leader>bb",
        function() require("telescope.builtin").buffers() end,
        desc = "Telescope (browse) Buffers",
      },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    init = function(_)
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      {
        "<leader>fb",
        function() require("telescope").extensions.file_browser.file_browser() end,
        desc = "Telescope file browser",
      },
    },
  },
}
