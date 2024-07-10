vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- move selection up/down a line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copy from cursor to end of line
vim.keymap.set("n", "Y", "yg$")

-- copy/paste from clipboard
-- need to install xclip if using X11
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- vnoremap("<leader>v", "\"+p")
-- nnoremap("<leader>v", "\"+p")

-- join current line with line below, keeping cursor in same position
-- nnoremap("J", "mzJ`z")

-- replaces highlighted text with buffer text
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- scroll half page and center cursor vertically on view
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- search word under cursor, without going to next instance
vim.keymap.set("n", "*", "*N")
