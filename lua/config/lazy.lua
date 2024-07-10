local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.g.mapleader = " "
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
})
