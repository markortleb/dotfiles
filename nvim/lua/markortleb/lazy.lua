require("lazy").setup({
  
  -- Dadbod SQL Completer
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  { "kristijanhusak/vim-dadbod-completion" }, 
 
  { import = "markortleb.plugins.core" },
  { import = "markortleb.plugins.lsp" }, 
  { import = "markortleb.plugins.editing" },
  { import = "markortleb.plugins.filetree"},
  -- { import = "markortleb.plugins.motion" },
  -- { import = "markortleb.plugins.tools" },
  { import = "markortleb.plugins.completion" }
 
})

