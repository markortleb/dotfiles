# My NeoVim Keymaps


Here are my Neovim keymaps. Assume all of these are for Normal Mode unless specified otherwise.


## General

- `<leader>e` -> Open Oil File Explorer.
- `<leader>d` -> Open Dashboard.
- `<leader>cc` -> Loop through color schemes.
- `<leader>rn` -> Toggle relative line numbers.
- `<leader>ww` -> Set the current working directory (a customer vim.g.work_dir var), to whichever folder your buffer is currently in.


## Harpoon

- `<leader>ha` -> Add buffer to Harpoon List.
- `<leader>hm` -> Open Harpoon Menu.
- `<leader>1` -> Switch to stored Harpoon buffer 1.
- `<leader>2` -> Switch to stored Harpoon buffer 2.
- `<leader>3` -> Switch to stored Harpoon buffer 3.
- `<leader>4` -> Switch to stored Harpoon buffer 4.
- `<leader>5` -> Switch to stored Harpoon buffer 5.
- `<leader>6` -> Switch to stored Harpoon buffer 6.
- `<leader>7` -> Switch to stored Harpoon buffer 7.
- `<leader>8` -> Switch to stored Harpoon buffer 8.
- `<leader>9` -> Switch to stored Harpoon buffer 9.


## Neotree

- `<leader>n` -> Open Neotree at work_dir.


## Splits


- `<leader>wv` -> Split window vertically.
- `<leader>w-` -> Split window horizontal.
- `<leader>wc` -> Close window split.

- `<leader>ww` -> Cycle through split-resize factor sizes.
- `<leader>wh` -> Resize window to the left.
- `<leader>wl` -> Resize window to the right.
- `<leader>wj` -> Resize window downward.
- `<leader>wk` -> Resize window upward.


## Telescope

- `<leader>ff` -> Find files in the work_dir.
- `<leader>fg` -> Grep in the work_dir. (Requires ripgrep to be installed)
- `<leader>fb` -> Telescope buffers.
- `<leader>fh` -> Telescope help tags.
- `<leader>fm` -> Telescope find files, starting from home dir.
- `<leader>fr` -> Telescope see recent files.


## Terminal

- `<leader>t` -> Toggle termnal 1. (Convenience case)
- `<leader>t1` -> Toggle termnal 1.
- `<leader>t2` -> Toggle termnal 2.
- `<leader>t3` -> Toggle termnal 3.
- `<leader>t4` -> Toggle termnal 4.
- `<leader>t5` -> Toggle termnal 5.
- `<leader>t6` -> Toggle termnal 6.

### Terminal Mode

- `<Esc>` -> Exit terminal mode. *Normally you would have to press* `<C-\><C-n>`


## CodeCompanion

- `<leader>a` -> Toggle CodeCompanion Chat.
- `<C-a>` -> CodeCompanion Actions.

### Visual Mode

- `ga` -> CodeCompanionChat Add


## Comment

### Visual Mode

- `gc` -> Comment the code in the visual selection.

