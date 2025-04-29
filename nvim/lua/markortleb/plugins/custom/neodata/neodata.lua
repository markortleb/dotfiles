return {
  dir = "~/src/dotfiles/nvim/lua/markortleb/plugins/custom/neodata/lua",
  name = "sqlui",
  lazy = false,  -- or true if you want to load it on demand
  config = function()
    require("markortleb.plugins.custom.neodata").setup()
  end,
}

