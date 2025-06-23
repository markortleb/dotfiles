local workingdirhelper = require("markortleb.utils.workingdirhelper.workingdirhelper")

vim.keymap.set(
    "n",
    "<leader>ww",
    workingdirhelper.set_working_dir,
    {
        desc = "Set the current working directory (a customer vim.g.work_dir var), to whichever folder your buffer is currently in.",
        noremap = true,
        silent = true
    }
)
