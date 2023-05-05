local servers = {
	"lua_ls",
  "rust_analyzer",
  "eslint",
  "tailwindcss",
  "prismals",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	-- "yamlls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("tecu.plugins.lsp.handlers").on_attach,
		capabilities = require("tecu.plugins.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]
  
    if server == "lua_ls" then
    local emmet_ls_opts = require "tecu.plugins.lsp.settings.lua_ls"
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  if server == "html" then
    local html_opts = require "tecu.plugins.lsp.settings.html"
    opts = vim.tbl_deep_extend("force", html_opts, opts)
  end

	local require_ok, conf_opts = pcall(require, "tecu.plugins.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end
  
	lspconfig[server].setup(opts)
  ::continue::
end
