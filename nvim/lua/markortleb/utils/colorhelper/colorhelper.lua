local M = {}


-- Utility to ensure parent dirs exist
local function ensure_dir(path)
    local dir = vim.fn.fnamemodify(path, ":h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p") -- 'p' creates parent dirs as needed
    end
end


-- Save state to disk
local function save_state(state_path, state)
    ensure_dir(state_path)

    local file = io.open(state_path, "w")
    if file then
      file:write(vim.fn.json_encode(state))
      file:close()
    end
end

local function apply_colorscheme(colorscheme_name)
    local ok, err = pcall(vim.cmd.colorscheme, colorscheme_name)
    if ok then
      vim.notify("Colorscheme is now " .. colorscheme_name)
    else
      vim.notify("Failed to load colorscheme: " .. colorscheme_name)
    end
end


local function get_current_index(state_path)
    local file = io.open(state_path, "r")
    local index = 1
    if file then
      local content = file:read("*a")
      file:close()
      local ok, data = pcall(vim.fn.json_decode, content)
      if ok and data and data.index then
        index = data.index
      end
    end

    return index
end


local function get_state_path()
    local base_path = vim.fn.stdpath("data") .. "/markortleb/utils/cyclecolor"
    local state_path = base_path .. "/colorscheme_state.json"

    return state_path
end


M.colors = {
    "gruvbox", 
    "tokyonight", 
    "nightfox",
    "lackluster", 
    "everforest",
    "kanagawa",
    "rose-pine",
    "onedark",
    "vscode",
    "dracula",
    "nord",
    "synthweave",
    "darkvoid",
    "one_monokai",
    "darcula-dark",
    "bamboo"
}


function M.cycle_colors()
    local state_path = get_state_path()
    local state = {}

    local index = get_current_index(state_path)


    index = index + 1
    if index > #M.colors then
      index = 1
    end

    apply_colorscheme(M.colors[index])

    state = {
        index = index
    }

    save_state(state_path, state)
end


function M.init_color()
    -- Function to set the color to 1 if none set, otherwise take the current color.
    local state_path = get_state_path()
    local index = get_current_index(state_path)

    apply_colorscheme(M.colors[index])
end


function M.init()
    M.init_color()

    vim.api.nvim_create_user_command('CycleColors', function()
      M.cycle_colors()
    end, {})
end

return M

