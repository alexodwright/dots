return {
  -- Mason installer
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason → LSP bridge
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
	  "clangd",
	  "pyright",
	  "stylua",
	  "eslint",
	  "bashls"
        },
        handlers = {
          function(server)
            lspconfig[server].setup({
              capabilities = capabilities,
            })
          end,
        },
      })
    end,
  },
  -- LSPConfig
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}
