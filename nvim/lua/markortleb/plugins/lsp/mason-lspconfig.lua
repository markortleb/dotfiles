
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { 
        "pyright", 
        "lua_ls", 
        "ts_ls",
      },
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup({})
    lspconfig.ts_ls.setup({})
    lspconfig.lua_ls.setup({})
  end,
}

