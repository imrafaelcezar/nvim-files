return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 40,
      },
      renderer = {
        indent_markers = { enable = true },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = false,
          },
        },
      },
      git = { ignore = false },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
  end
}
