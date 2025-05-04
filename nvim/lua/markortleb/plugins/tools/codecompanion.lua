return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      ollama = {
        model = "codellama", -- Replace with your desired model
        url = "http://localhost:11434/api/chat", -- Default Ollama chat endpoint
      },
    },
    adapter = "ollama",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

