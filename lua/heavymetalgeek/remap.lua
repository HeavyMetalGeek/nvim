local nnoremap = require("heavymetalgeek.keymap").nnoremap
local vnoremap = require("heavymetalgeek.keymap").vnoremap
local xnoremap = require("heavymetalgeek.keymap").xnoremap

nnoremap("<leader>ff", "<cmd>Ex<CR>")
-- move selection up/down a line
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- copy from cursor to end of line
nnoremap("Y", "yg$")

-- copy/paste from clipboard
vnoremap("<leader>c", "\"+y")
nnoremap("<leader>c", "\"+y")
vnoremap("<leader>v", "\"+p")
nnoremap("<leader>v", "\"+p")

-- join current line with line below, keeping cursor in same position 
-- nnoremap("J", "mzJ`z")

-- replaces highlighted text with buffer text
xnoremap("<leader>p", "\"_dP")

-- scroll half page and center cursor vertically on view
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("N", "Nzzzv")
nnoremap("n", "nzzzv")

