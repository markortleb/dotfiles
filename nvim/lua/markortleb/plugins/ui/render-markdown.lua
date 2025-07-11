return {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "markdown",
    config = function()
        require("render-markdown").setup({})
    end,
}

