
-- Set leader before mapping anything
vim.g.mapleader = " "

-- Mappings
vim.keymap.set("n", "<leader>db", ":DBUI<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Open Oil file explorer." })
vim.keymap.set("n", "<leader>n", ":Neotree toggle left<CR>", { desc = "Open Neo Tree file explorer." })

-- Oil Mappings
vim.keymap.set("n", "<leader>cd", ":Oil -new-dir<CR>", { noremap = true, silent = true, desc = "Create a new directory in Oil" })

-- Cross-platform clipboard support
if vim.fn.has("wsl") == 1 then
  -- WSL clipboard using win32yank
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
elseif vim.fn.has("mac") == 1 then
  -- macOS clipboard using pbcopy/pbpaste
  vim.g.clipboard = {
    name = "macOS-clipboard",
    copy = {
      ["+"] = "pbcopy",
      ["*"] = "pbcopy"
    },
    paste = {
      ["+"] = "pbpaste",
      ["*"] = "pbpaste"
    },
    cache_enabled = 0,
  }
elseif vim.fn.executable("xclip") == 1 then
  -- Linux with xclip
  vim.g.clipboard = {
    name = "xclip-clipboard",
    copy = {
      ["+"] = "xclip -selection clipboard -in",
      ["*"] = "xclip -selection primary -in"
    },
    paste = {
      ["+"] = "xclip -selection clipboard -out",
      ["*"] = "xclip -selection primary -out"
    },
    cache_enabled = 0,
  }
elseif vim.fn.executable("xsel") == 1 then
  -- Linux with xsel
  vim.g.clipboard = {
    name = "xsel-clipboard",
    copy = {
      ["+"] = "xsel --clipboard --input",
      ["*"] = "xsel --primary --input"
    },
    paste = {
      ["+"] = "xsel --clipboard --output",
      ["*"] = "xsel --primary --output"
    },
    cache_enabled = 0,
  }
end

