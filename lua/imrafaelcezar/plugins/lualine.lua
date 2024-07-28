return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  priority = 1000,
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "nightfly",
        component_separators = { left = " ", right = " "},
        section_separators = { left = " ", right = " "},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_z = { "location" },
      },
    })
  end,
}
