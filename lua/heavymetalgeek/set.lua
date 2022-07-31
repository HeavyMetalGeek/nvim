vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes" 
vim.opt.colorcolumn = "80"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.errorbells = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append("c")

-- Leader character
vim.g.mapleader = " "

vim.opt.updatetime = 50
