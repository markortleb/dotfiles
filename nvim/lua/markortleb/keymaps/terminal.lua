
-- Terminal Toggles

vim.keymap.set('n', '<leader>t', ':ToggleTerm 1 dir=%:p:h<CR>', { noremap = true, silent = true }) -- convenience case, set to terminal 1
vim.keymap.set('n', '<leader>t1', ':ToggleTerm 1 dir=%:p:h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t2', ':ToggleTerm 2 dir=%:p:h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t3', ':ToggleTerm 3 dir=%:p:h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t4', ':ToggleTerm 4 dir=%:p:h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t5', ':ToggleTerm 5 dir=%:p:h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t6', ':ToggleTerm 6 dir=%:p:h<CR>', { noremap = true, silent = true })


-- Exit terminal mode using Esc (from insert -> normal)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
