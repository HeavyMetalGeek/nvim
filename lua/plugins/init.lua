-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
		  vim.cmd([[colorscheme tokyonight]])
		end,
	},

	-- harpoon
	{ "ThePrimeagen/harpoon" },

	-- undotree
	{ "mbbill/undotree" },

	-- fugitive
	{ "tpope/vim-fugitive" },

	-- ripgrep
	{ "BurntSushi/ripgrep" },

	-- lightline
	{ "itchyny/lightline.vim" },
}
