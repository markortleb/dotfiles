local tz = require("tz")


local M = {}


function M.get_current_time()
    local current_time = os.date("%Y-%m-%d %H:%M:%S")

    vim.notify(current_time)

end

function M.get_current_time_by_tz(timezone)
    local timestamp = os.time()
    local current_time_by_tz = tz.date("%Y-%m-%d %H:%M:%S", timestamp, timezone)

    vim.notify(current_time_by_tz)
end

function M.init()
    vim.api.nvim_create_user_command('GetCurTime', function()
      M.get_current_time()
    end, {})

    vim.api.nvim_create_user_command("GetUTCTime", function()
        M.get_current_time_by_tz("UTC")
    end, {})
end

return M

