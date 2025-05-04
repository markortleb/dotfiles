return {
    "olimorris/codecompanion.nvim",
    opts = {
        adapters = {
            ollama = function()
                return require("codecompanion.adapters").extend("ollama", {
                    schema = {
                        model = {
                            default = "deepseek-coder:6.7b",
                        },
                        num_ctx = {
                            default = 20000,
                        },
                    },
                })
            end,
        },
        strategies = {
            chat = {
                adapter = "ollama"
            },
            inline = {
                adapter = "ollama"
            }
        }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
}

