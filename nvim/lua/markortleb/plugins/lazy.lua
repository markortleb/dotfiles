require("lazy").setup({
  
  { "neovim/nvim-lspconfig" },
  { import = "markortleb.plugins.mason" },
  { import = "markortleb.plugins.mason-lspconfig" },


  { import = "markortleb.plugins.autopairs" },
  { import = "markortleb.plugins.treesitter" },
  { import = "markortleb.plugins.sqlui" },


  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  { "kristijanhusak/vim-dadbod-completion" }, 
})

