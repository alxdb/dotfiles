return {
  {
    "Shatur/neovim-ayu", 
    main = "ayu",
    opts = { mirage = true },
    init = function(_)
      require("ayu").colorscheme()
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "Shatur/neovim-ayu" },
    opts = {
      sections = {
        lualine_x = { 'filetype' },
        lualine_y = {}
      }
    },
  }
}
