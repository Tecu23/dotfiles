local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }


  local harpoon = require("harpoon")

  harpoon:setup()

  keymap("n", "<leader>a", function() harpoon:list():append() end)
  keymap("n", "<s-m>", function() harpoon:list():append() end)
  keymap("n", "<TAB>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
  
  keymap("n", "<C-h>", function() harpoon:list():select(1) end)
  keymap("n", "<C-t>", function() harpoon:list():select(2) end)
  keymap("n", "<C-n>", function() harpoon:list():select(3) end)
  keymap("n", "<C-s>", function() harpoon:list():select(4) end)

  -- keymap("n", "<s-m>", "<cmd>lua require('tecu.plugins.harpoon').mark_file()<cr>", opts)
  -- keymap("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)

  -- Toggle previous & next buffers stored within Harpoon list
  keymap("n", "<C-q>", function() harpoon:list():prev() end)
  keymap("n", "<C-w>", function() harpoon:list():next() end)
end

function M.mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"
end

return M
