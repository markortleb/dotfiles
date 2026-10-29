local tmuxsend = require("markortleb.utils.tmuxsend.tmuxsend")

vim.keymap.set("n", "<leader>sf", tmuxsend.send_file_path, {
    noremap = true,
    silent = true,
    desc = "Send current file's path to the tmux agent pane",
})

vim.keymap.set("n", "<leader>sd", tmuxsend.send_dir_path, {
    noremap = true,
    silent = true,
    desc = "Send current directory (relative to work dir) to the tmux agent pane",
})

vim.keymap.set("n", "<leader>yd", tmuxsend.copy_dir_path, {
    noremap = true,
    silent = true,
    desc = "Copy current directory (relative to work dir) to the clipboard",
})

vim.keymap.set("v", "<leader>ss",tmuxsend.send_selection, {
    noremap = true,
    silent = true,
    desc = "Send visual selection to the tmux agent pane",
})
