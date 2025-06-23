-- Function to open ToggleTerm using vim.g.work_dir
local function toggle_term_in_work_dir(term_id)
  local dir = vim.g.work_dir or vim.fn.getcwd()
  local cmd = "ToggleTerm " .. term_id .. " dir=" .. vim.fn.fnameescape(dir)
  vim.cmd(cmd)
end

-- Terminal Toggles using work_dir
vim.keymap.set('n', '<leader>t',  function() toggle_term_in_work_dir(1) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t1', function() toggle_term_in_work_dir(1) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t2', function() toggle_term_in_work_dir(2) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t3', function() toggle_term_in_work_dir(3) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t4', function() toggle_term_in_work_dir(4) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t5', function() toggle_term_in_work_dir(5) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t6', function() toggle_term_in_work_dir(6) end, { noremap = true, silent = true })

-- Exit terminal mode using Esc
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
