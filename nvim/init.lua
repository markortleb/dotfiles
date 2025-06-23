-- Set Leader
require("markortleb.keymaps.leader")


-- Load Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setting Path
local pathhelper = require("markortleb.utils.pathhelper.pathhelper")
pathhelper.set_path()

-- Rocks Helper
local rockshelper = require("markortleb.utils.rockshelper.rockshelper")
rockshelper.init()

-- Working Dir Helper
local workingdirhelper = require("markortleb.utils.workingdirhelper.workingdirhelper")
workingdirhelper.init()


require("markortleb.lazy")
require("markortleb.keymaps")
require("markortleb.plugins.core.treesitter")
require("markortleb.settings")
require("markortleb.utils")

