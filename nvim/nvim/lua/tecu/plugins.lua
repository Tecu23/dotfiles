local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({border = "rounded"})
    end,
  },
})

return packer.startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'  -- Have Packer manage itself

  use 'nvim-lua/popup.nvim'     -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim'   -- Useful lua functions used by lots of plugins

  -- Autopairs
  use 'windwp/nvim-autopairs'   -- Autopairs, integrates with both cmp and treesitter

  -- Colorschemes
  use 'LunarVim/Colorschemes'
  use({ 'rose-pine/neovim', as = 'rose-pine'})

  -- Completions Plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use "hrsh7th/vim-vsnip"

  -- LSP
  use {"neovim/nvim-lspconfig", run = ":MasonUpdate"} -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim"
	use "jose-elias-alvarez/null-ls.nvim"   -- for formatters and linters
  use "RRethy/vim-illuminate"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Nvim Tree
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Lualine
  use "nvim-lualine/lualine.nvim"

  -- Terminal
  use 'NvChad/nvterm'

  -- Project Neovim
  use "ahmedkhalf/project.nvim"

  -- Impatient
  use "lewis6991/impatient.nvim"

  -- Indent Blankline
  use "lukas-reineke/indent-blankline.nvim"

  -- Alpha Neovim
  use "goolord/alpha-nvim"

  -- Which Key
  use "folke/which-key.nvim"

  -- Comment
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
	use "lewis6991/gitsigns.nvim"

  -- To be Removed Later Plugins
  use 'ThePrimeagen/vim-be-good'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
