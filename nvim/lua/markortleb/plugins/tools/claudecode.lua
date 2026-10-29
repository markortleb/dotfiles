return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
        terminal = {
            -- Spawn Claude in the directory set by <leader>ww
            cwd_provider = function()
                return vim.g.work_dir
            end,
            split_side = "right",
            split_width_percentage = 0.40,
        },
    },
}
