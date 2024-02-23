require "tecu.launch"

-- CORE FUNCTIONALITY (OPTIONS, KEYMAPS)
require "tecu.core.options"
require "tecu.core.keymaps"

require "tecu.plugins.autocmds"

-- Plugins
spec "tecu.plugins.colorscheme"
spec "tecu.plugins.treesitter"
spec "tecu.plugins.schemastore"
spec "tecu.plugins.cmp"
spec "tecu.plugins.telescope"
spec "tecu.plugins.illuminate"
spec "tecu.plugins.gitsigns"
spec "tecu.plugins.whichkey"
spec "tecu.plugins.nvterm"
spec "tecu.plugins.comment"
spec "tecu.plugins.lualine"
spec "tecu.plugins.navic"
spec "tecu.plugins.breadcrumbs"
spec "tecu.plugins.hardtime"
spec "tecu.plugins.harpoon"
spec "tecu.plugins.autopairs"
spec "tecu.plugins.neotest"
spec "tecu.plugins.alpha"
spec "tecu.plugins.indentline"

-- LSP
spec "tecu.lsp.mason"
spec "tecu.lsp.none-ls"
spec "tecu.lsp.lspconfig"

-- Lazy Nvim
require "tecu.lazy"
