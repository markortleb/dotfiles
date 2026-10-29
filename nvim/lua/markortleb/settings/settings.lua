vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Reload buffers changed on disk (e.g. by an agent CLI in a tmux pane)
-- instead of silently editing a stale copy. Paired with the checktime
-- autocmd in autocmds.lua, since autoread alone only fires on a few
-- built-in events.
vim.opt.autoread = true
