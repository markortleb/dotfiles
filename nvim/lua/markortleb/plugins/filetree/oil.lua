return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    keymaps = {
      -- Oil binds these by default, which shadows the global <C-h>/<C-l>
      -- split/tmux navigation (plugins/tools/tmux-navigator.lua) in oil buffers.
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      -- Their replacements
      ["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
      ["gr"] = "actions.refresh",
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)
  end,
}

