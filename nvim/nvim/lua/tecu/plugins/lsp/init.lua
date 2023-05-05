local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "tecu.plugins.lsp.mason"
require("tecu.plugins.lsp.handlers").setup()
require "tecu.plugins.lsp.null-ls"
