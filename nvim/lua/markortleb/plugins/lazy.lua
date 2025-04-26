require("lazy").setup({
  
  -- Dadbod SQL Completer
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  { "kristijanhusak/vim-dadbod-completion" }, 
  
  -- LSP and Mason
  { import = "markortleb.plugins.lsp" }, 
  { import = "markortleb.plugins.mason" },
  { import = "markortleb.plugins.mason-lspconfig" },
   
  -- Code Completion
  { import = "markortleb.plugins.cmp" },

   -- File Explorer
  { import = "markortleb.plugins.neotree"},

  { import = "markortleb.plugins.autopairs" },
  { import = "markortleb.plugins.treesitter" },
  { import = "markortleb.plugins.sqlui" },
 
})

