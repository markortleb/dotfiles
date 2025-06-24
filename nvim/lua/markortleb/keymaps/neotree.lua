vim.keymap.set('n', '<leader>n', function()
  vim.cmd('Neotree toggle dir=' .. vim.g.work_dir)
end, { noremap = true, silent = true, desc = "Open Neo-tree at work_dir" })
