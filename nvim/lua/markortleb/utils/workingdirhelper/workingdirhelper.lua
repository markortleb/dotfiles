local M = {}

function M.set_working_dir() 
    local bufname = vim.api.nvim_buf_get_name(0)
    local filetype = vim.bo.filetype
    local dir

    if filetype == "oil" then
        -- Strip the "oil://" prefix to get the real directory path
        dir = string.gsub(bufname, "^oil://", "")
    elseif bufname ~= "" then
        dir = vim.fn.fnamemodify(bufname, ":p:h") -- Directory of file
    else
        dir = vim.fn.getcwd() -- Fallback
    end

    vim.g.work_dir = dir
    print("Working dir set to: " .. dir)
end

function M.init()
    vim.g.work_dir = vim.fn.expand("~")
end

return M
