
local M = {}

function M.setup()
    -- Dim inactive splits and highlight current one
    vim.cmd("highlight NormalNC guibg=#1e1e1e") -- adjust this to your theme

    -- Set highlight for inactive windows (after colorscheme loads)
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd("highlight NormalNC guibg=#1e1e1e") -- adjust this to your theme
      end,
    })

    -- Highlight active window
    vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
      callback = function()
        vim.wo.winhighlight = "Normal:Normal,NormalNC:Normal"
      end,
    })

    -- Dim inactive windows
    vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
      callback = function()
        vim.wo.winhighlight = "Normal:NormalNC,NormalNC:NormalNC"
      end,
    })


end


return M
