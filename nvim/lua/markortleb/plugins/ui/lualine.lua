-- markortleb/plugins/lualine.lua

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
        globalstatus = false,
      },
      sections = {
        lualine_a = {
          function()
            if vim.api.nvim_get_current_win() == vim.g.statusline_winid then
              return "●"
            else
              return " "
            end
          end,
          'mode'
        },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end
}
