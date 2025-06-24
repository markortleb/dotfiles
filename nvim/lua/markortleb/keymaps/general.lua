
-- Mappings
vim.keymap.set("n", "<leader>db", ":DBUI<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Open Oil file explorer." })

-- Oil Mappings
vim.keymap.set("n", "<leader>cd", ":Oil -new-dir<CR>", { noremap = true, silent = true, desc = "Create a new directory in Oil" })

-- Dashboard Mappings
vim.keymap.set("n", "<leader>d", ":Dashboard<CR>", { desc = "Create a new directory in Oil" })

-- Fun Mappings
vim.keymap.set("n", "<leader>cc", ":CycleColors<CR>", { desc = "Loop through color schemes." })

-- Relative Line Number toggle
vim.keymap.set(
  "n",
  "<leader>rn", 
  function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end,
  { desc = "Toggle relative line numbers" }
)

-- Editing mappings

vim.keymap.set("n", "<leader>r", 'viw"_dP', { noremap = true, silent = true, desc = "Replace a word with yanked text in clipboard, without overwriting the clipboard." })
