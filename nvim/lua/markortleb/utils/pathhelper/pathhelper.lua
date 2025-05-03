local M = {}


function M.set_path()
    local base = vim.fn.stdpath("config") .. "/lua/markortleb/vendored"
    local ver = "5.1" 
    package.path = package.path .. ";" .. base .. "/share/lua/" .. ver .. "/?.lua;" .. base .. "/share/lua/" .. ver .. "/?/init.lua"
    package.cpath = package.cpath .. ";" .. base .. "/lib/lua/" .. ver .. "/?.so"
end

return M
