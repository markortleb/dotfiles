-- Global resize factor and steps
local resize_steps = {5, 10, 20}
local step_index = 2 -- starts at 10
vim.g.resize_factor = resize_steps[step_index]

local function cycle_resize_factor()
  step_index = step_index % #resize_steps + 1
  vim.g.resize_factor = resize_steps[step_index]
  print("Resize factor set to " .. vim.g.resize_factor)
end

-- Cycle resize factor
vim.keymap.set('n', '<leader>ww', cycle_resize_factor, { noremap = true, silent = false })

-- Resize mappings using current resize factor
vim.keymap.set('n', '<leader>wh', function()
  vim.cmd("vertical resize -" .. vim.g.resize_factor)
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>wl', function()
  vim.cmd("vertical resize +" .. vim.g.resize_factor)
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>wj', function()
  vim.cmd("resize -" .. vim.g.resize_factor)
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>wk', function()
  vim.cmd("resize +" .. vim.g.resize_factor)
end, { noremap = true, silent = true })

-- Splits
vim.keymap.set('n', '<leader>wv', ':vsplit<CR><C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w-', ':split<CR><C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wc', ':close<CR>', { noremap = true, silent = true })
