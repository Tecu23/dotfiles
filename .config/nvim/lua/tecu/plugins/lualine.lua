local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
      theme = "nord",
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { "branch", "diff"},
      lualine_c = { "diagnostics" },
      lualine_x = { "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
