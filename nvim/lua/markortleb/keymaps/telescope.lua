-- Find Files
vim.keymap.set(
  "n",
  "<leader>ff",
  function()
    require("telescope.builtin").find_files()
  end,
  { desc = "Telescope find files." }
)


-- Live Grep
vim.keymap.set(
  "n",
  "<leader>fg",
  function()
    require("telescope.builtin").live_grep()
  end,
  { desc = "Telescope live grep." }
)



-- Telescope Buffers 
vim.keymap.set(
  "n",
  "<leader>fb",
  function()
    require("telescope.builtin").buffers()
  end,
  { desc = "Telescope buffers." }
)



-- Telescope Help 
vim.keymap.set(
  "n",
  "<leader>fh",
  function()
    require("telescope.builtin").help_tags()
  end,
  { desc = "Telescope help tags." }
)
