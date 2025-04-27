
-- Set leader before mapping anything
vim.g.mapleader = " "

-- Mappings
vim.keymap.set("n", "<leader>db", ":DBUI<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Open Oil file explorer." })
vim.keymap.set("n", "<leader>n", ":Neotree toggle left<CR>", { desc = "Open Neo Tree file explorer." })

-- Oil Mappings
vim.keymap.set("n", "<leader>cd", ":Oil -new-dir<CR>", { noremap = true, silent = true, desc = "Create a new directory in Oil" })


-- Fun Mappings
vim.keymap.set("n", "<leader>cc", ":CycleColors<CR>", { desc = "Loop through color schemes." })


