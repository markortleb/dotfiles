local M = {}

-- Function 1: Say hello
function M.say_hello()
  print("Hello, world from sqlui!")
end

-- Function 2: Fake run query
function M.run_query()
  print("Pretend we're running an SQL query here!")
end

-- Setup custom commands
function M.setup()
  vim.api.nvim_create_user_command("SQLHello", function()
    M.say_hello()
  end, {})

  vim.api.nvim_create_user_command("SQLRun", function()
    M.run_query()
  end, {})
end

return M

