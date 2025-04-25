vim.keymap.set("n", "<leader>db", ":DBUI<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Open file explorer" })


vim.g.mapleader = " "


vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf"
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf"
  },
  cache_enabled = 0,
}

