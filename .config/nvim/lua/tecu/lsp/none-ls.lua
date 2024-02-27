local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local completions = null_ls.builtins.completion

  null_ls.setup {
    debug = false,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.black,

      diagnostics.buf,
      diagnostics.revive,

      completions.spell,
    },
  }
end

return M
