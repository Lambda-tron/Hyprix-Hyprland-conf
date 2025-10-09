return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },
{
  "Everblush/nvim",
  name = "everblush",
  lazy = false,
  config = function()
    require("everblush").setup({
      -- optional configuration, see their README
      transparent_background = false,
      nvim_tree = { contrast = false },
    })
    vim.cmd("colorscheme everblush")
  end,
},

}
