local M = {}

local message = {
  "Hello from Lua!",
  "This is a floating window.",
  "",
  "Press q to close."
}


function M.create_window()
    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, message)

    local width = 40
    local height = #message
    local opts = {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        row = (vim.o.lines - height) / 2,
        col = (vim.o.columns - width) / 2,
        border = "rounded"
    }

    local win = vim.api.nvim_open_win(buf, true, opts)
end


return M
