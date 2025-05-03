local M = {}

local config_path = vim.fn.stdpath("config")

local rocks = {
    "lua-tz"
}

local version = "5.1"

local function run_cmd(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    vim.notify(result)

end

function M.rocks_install()
    for i, rock in ipairs(rocks)
        local cd_cmd = "cd " .. config_path
        local install_cmd = "luarocks --lua-version=" .. version .. " --tree=/lua/markortleb/vendored install " .. rock
        local command = cd_cmd .. " && " .. install_cmd

        vim.notify("Running command " .. command)
        run_cmd(command)
    end
end

function M.init()

    vim.api.nvim_create_user_command('RocksInstall', function()
      M.rocks_install()
    end, {})
end

return M
