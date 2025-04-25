return {
  dir = "~/src/dotfiles/nvim/lua/markortleb/sqlui",
  name = "sqlui",
  lazy = false,  -- or true if you want to load it on demand
  config = function()
    require("markortleb.sqlui").setup()
  end,
}

