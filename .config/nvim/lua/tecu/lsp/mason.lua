local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}

function M.config()
  local servers = {
        "bashls",
        "biome",
        "cssls",
        "dockerls",
        "gofumpt",
        "goimports",
        "goimports-reviser",
        "golines",
        "gomodifytags",
        "gopls",
        "gotests",
        "html",
        "iferr",
        "impl",
        "jsonls",
        "lua_ls",
        "pyright",
        "revive",
        "sqls",
        "tailwindcss",
        "tsserver",
        "yamlls",
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M
