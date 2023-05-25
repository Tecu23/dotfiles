local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {"c", "cpp", "css", "bash", "dockerfile", "git_config", "git_rebase", "dot", "gitattributes", "gitcommit", "gitignore", "html", "javascript", "vim", "scss", "jsdoc", "json", "lua", "markdown", "markdown_inline", "prisma", "python", "ruby", "rust", "sql", "typescript", "yaml"}, -- one of "all" or a list of languagesnstall = false, -- install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
		enable = true,
	},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml" } },
   context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
    disable = { "xml", "markdown" },
  },
  rainbow = {
    enable = true,
    colors = {
      "#68a0b0",
      "#946EaD",
      "#c7aA6D",
      -- "Gold",
      -- "Orchid",
      -- "DodgerBlue",
      -- "Cornsilk",
      -- "Salmon",
      -- "LawnGreen",
    },
  disable = { "html" }
  },
  playground = {
    enable = true,
  },
}
