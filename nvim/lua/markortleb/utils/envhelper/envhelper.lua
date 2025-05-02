local M = {}


function M.set_path()
    local home = os.getenv("HOME")
    local ver = _VERSION:match("Lua (%d+%.%d+)")
    package.path = package.path .. ";" .. home .. "/.luarocks/share/lua/" .. ver .. "/?.lua"
    package.cpath = package.cpath .. ";" .. home .. "/.luarocks/lib/lua/" .. ver .. "/?.so"
end

return M
