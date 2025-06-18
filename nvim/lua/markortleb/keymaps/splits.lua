-- Global resize factor and step list
local resize_steps = { 10, 20, 30 }
local step_index = 2 -- starts at 5
vim.g.resize_factor = resize_steps[step_index]

-- Function to cycle resize factor
local function cycle_resize_factor()
  step_index = step_index % #resize_steps + 1
  vim.g.resize_factor = resize_steps[step_index]
  print("Resize factor set to " .. vim.g.resize_factor)
end

-- Keymap to cycle factor
vim.keymap.set('n', '<leader>rf', cycle_resize_factor, { noremap = true, silent = false })

-- Resize mappings using current resize factor
vim.keymap.set('n', '<leader>rh', function()
  vim.cmd("vertical resize -" .. vim.g.resize_factor)
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rl', function()
  vim.cmd("vertical resize +" .. vim.g.resize_factor)
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rj', function()
  vim.cmd("resize -" .. vim.g.resize_factor)
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rk', function()
  vim.cmd("resize +" .. vim.g.resize_factor)
end, { noremap = true, silent = true })



-- Create vertical split
vim.keymap.set('n', '<leader>sv', ':vsplit<CR><C-w>l', { noremap = true, silent = true })

-- Create horizontal split
vim.keymap.set('n', '<leader>sh', ':split<CR><C-w>j', { noremap = true, silent = true })


-- Set split close shortcut
vim.keymap.set('n', '<leader>sc', ':close<CR>', { noremap = true, silent = true })

