return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local lspconfig = require("lspconfig")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(event)
        local options = {
          buffer = event.buf,
          silent = true
        }

        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", options)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, options)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, options)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, options)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, options)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
        vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<cr>", options)
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        })
      end,
    })
  end,
}
