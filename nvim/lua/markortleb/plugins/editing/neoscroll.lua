return {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup({
      easing_function = "sine",
      hide_cursor = true,
      -- Remove default mappings if you want full control
      mappings = {},
    })

    local neoscroll = require("neoscroll")

    local map = vim.keymap.set
    local opts = { silent = true, nowait = true }

    map("n", "<C-d>", function()
        neoscroll.ctrl_d({duration = 250})
    end, opts)

    map("n", "<C-u>", function()
        neoscroll.ctrl_u({duration = 250})
    end, opts)

    map("n", "<C-f>", function()
      neoscroll.ctrl_f({duration = 450})
    end, opts)

    map("n", "<C-b>", function()
      neoscroll.ctrl_b({duration = 450})
    end, opts)
  end,
}

