return {
  {
    "3rd/image.nvim",
    config = function()
      require("image").setup({
        backend = "kitty",  -- or "wezterm", "ueberzug"
        integrations = {
          markdown = {
            enabled = true,
            download_remote_images = true,
          },
        },
     

	max_width = 100,
        max_height = 12,
        max_width_window_percentage = 50,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs" },
      })

    end,
  },
}

