return {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
    },
    keys = {
        -- These replace the plain <C-w>h/j/k/l mappings that used to live in
        -- keymaps/splits.lua. Inside nvim they behave the same; at the edge
        -- of nvim's windows they cross into the adjacent tmux pane instead
        -- of no-op'ing. Pairs with christoomey/vim-tmux-navigator in
        -- tmux/.tmux.conf, which must be installed (prefix + I via tpm).
        { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
}
