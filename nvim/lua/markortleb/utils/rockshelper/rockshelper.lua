local M = {}

local base_path = vim.fn.stdpath("config") .. "/lua/markortleb"

local rocks = {
    "lua-tz"
}

local version = "5.1"

local function run_cmd(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    --print(result)

end

function M.rocks_install()
    for i, rock in ipairs(rocks) do
        local cd_cmd = "cd " .. base_path
        local install_cmd = "luarocks --lua-version=" .. version .. " --tree=vendored install " .. rock
        local command = cd_cmd .. " && " .. install_cmd

        print("Running command " .. command)
        run_cmd(command)
        --vim.cmd("redraw!")
    end
end

function M.init()

    vim.api.nvim_create_user_command('RocksInstall', function()
      M.rocks_install()
    end, {})
end

return M
