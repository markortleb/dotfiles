local query = require("markortleb.sqlui.query")
local ui = require("markortleb.sqlui.ui")

local M = {}

function M.setup()
  vim.api.nvim_create_user_command("SQLHello", function()
    ui.say_hello()
  end, {})

  vim.api.nvim_create_user_command("SQLRun", function()
    query.run_current_query()
  end, {})
end

return M

