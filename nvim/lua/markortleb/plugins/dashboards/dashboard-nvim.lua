
local header = [[

 ▄▀▀▄ ▄▀▄  ▄▀▀█▄   ▄▀▀▄▀▀▀▄  ▄▀▀▄ █      ▄▀▀▀▀▄   ▄▀▀▄▀▀▀▄  ▄▀▀▀█▀▀▄  ▄▀▀▀▀▄     ▄▀▀█▄▄▄▄  ▄▀▀█▄▄  
█  █ ▀  █ ▐ ▄▀ ▀▄ █   █   █ █  █ ▄▀     █      █ █   █   █ █    █  ▐ █    █     ▐  ▄▀   ▐ ▐ ▄▀   █ 
▐  █    █   █▄▄▄█ ▐  █▀▀█▀  ▐  █▀▄      █      █ ▐  █▀▀█▀  ▐   █     ▐    █       █▄▄▄▄▄    █▄▄▄▀  
  █    █   ▄▀   █  ▄▀    █    █   █     ▀▄    ▄▀  ▄▀    █     █          █        █    ▌    █   █  
▄▀   ▄▀   █   ▄▀  █     █   ▄▀   █        ▀▀▀▀   █     █    ▄▀         ▄▀▄▄▄▄▄▄▀ ▄▀▄▄▄▄    ▄▀▄▄▄▀  
█    █    ▐   ▐   ▐     ▐   █    ▐               ▐     ▐   █           █         █    ▐   █    ▐   
▐    ▐                      ▐                              ▐           ▐         ▐        ▐        







]]


return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("dashboard").setup({
      theme = "doom", -- or "hyper", you can choose
      config = {
        header = vim.split(header, "\n"),
        center = {
          { icon = "  ", desc = "Recently opened files", action = "Telescope oldfiles" },
          { icon = "  ", desc = "Find File          ", action = "Telescope find_files" },
          { icon = "  ", desc = "File Browser       ", action = "Oil" },
          { icon = "  ", desc = "Find Word          ", action = "Telescope live_grep" },
        },
      },
    })
  end,
}

