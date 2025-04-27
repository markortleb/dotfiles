local M = {}

local colors = {
  "gruvbox",
  "tokyonight",
  "nightfox",
  "lackluster",
  "everforest"
}

local index = 1

function M.cycle_colors()
  index = index + 1
  if index > #colors then
    index = 1
  end

  vim.cmd("colorscheme " .. colors[index])
  print("Colorscheme is now " .. colors[index])

end

-- Register the custom command
vim.api.nvim_create_user_command('CycleColors', function()
  M.cycle_colors()
end, {})

return M
