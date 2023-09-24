vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("i", "JK", "<ESC>")

keymap.set("n", "q", ":q<CR>") -- Quit NVIM
keymap.set("n", "<C-q>", ":qa<CR>") -- Quit all NVIM
keymap.set("n", "<C-w>", ":w<CR>") -- Write file

keymap.set("n", "<leader>nh", ":nohl<CR>")

-- keymap.set("n", "<A-b>", ":bdelete<CR>") -- close buffer
-- keymap.set("n", "<C-A-b>", ":bdelete!<CR>") -- close buffer without saving

keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<C-S-tab>", ":KittyNavigateLeft<cr>")
keymap.set("n", "<C-tab>", ":KittyNavigateRight<cr>")
keymap.set("n", "<C-h>", ":KittyNavigateLeft<cr>")
keymap.set("n", "<C-l>", ":KittyNavigateRight<cr>")
keymap.set("n", "<C-left>", ":KittyNavigateLeft<cr>")
keymap.set("n", "<C-right>", ":KittyNavigateRight<cr>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("i", "<C-w>", "<ESC>:w<CR>")
-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])
keymap.set({ "n", "v" }, "d", [["_d]])
keymap.set({ "n", "v" }, "D", "d")
keymap.set("n", "p", "p']")
keymap.set("v", "p", "P")

-- Navigate buffers
-- keymap.set("n", "<C-A-l>", ":bnext<CR>") -- next buffer
-- keymap.set("n", "<C-A-h>", ":bprevious<CR>") -- previous buffer
keymap.set("n", "<A-l>", ":bnext<CR>") -- next buffer
keymap.set("n", "<A-h>", ":bprevious<CR>") -- previous buffer
keymap.set("n", "<A-right>", ":bnext<CR>") -- next buffer
keymap.set("n", "<A-left>", ":bprevious<CR>") -- previous buffer

-- Enable and disable auto comment
keymap.set("n", "<leader>c", ":setlocal formatoptions-=cro<CR>")
keymap.set("n", "<leader>C", ":setlocal formatoptions=cro<CR>")

keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

-- Resize with arrows
-- keymap.set("n", "<C-Up", ":resize +2<CR>")
-- keymap.set("n", "<C-Down", ":resize -2<CR>")
-- keymap.set("n", "<C-Left", ":vertical resize -2<CR>")
-- keymap.set("n", "<C-Right", ":vertical resize +2<CR>")

-- Move text in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Undo makes more sense
keymap.set("n", "U", ":redo<CR>")

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
--keymap.set("n", "<leader>et", ":NvimTreeToggle<CR>")
--keymap.set("n", "<C-t>", "<leader>fe<CR>")
--keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>")
--keymap.set("n", "<C-n>", ":tabnew<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set("n", "<C-z>", ":Lazy<CR>") -- Open Lazy

-- nvim-spider
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-w" })
