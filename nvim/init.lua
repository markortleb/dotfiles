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
local envhelper = require("nvim.lua.markortleb.utils.envhelper.envhelper")
envhelper.set_path()

require("markortleb.keymaps")
require("markortleb.lazy")
require("markortleb.plugins.core.treesitter")
require("markortleb.settings")
require("markortleb.utils")
