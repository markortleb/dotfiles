return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {
        window = {
            position = "left",
            width = 30,
        },
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
    end,
}

