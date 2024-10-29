-- custom keybindings

local setkey = vim.keymap.set

vim.g.mapleader = " " -- setting SPACE key as leader

setkey({ "n", "v" }, "<leader>fz", "<cmd>Telescope find_files<CR>") -- invoke Telescope fuzzy finder
setkey({ "n", "v" }, "<leader>fj", "<cmd>Telescope jumplist<CR>")
setkey({ "n", "v" }, "<leader>ft", "<cmd>Telescope tagstack<CR>")
setkey({ "n", "v" }, "<leader>fr", "<cmd>Telescope grep_string<CR>")

setkey({ "n", "v" }, "<leader>fd", ":NvimTreeToggle<CR>") -- toggle file tree

setkey({ "n", "v" }, "<leader>`", ":FloatermNew --height=0.8 --width=0.8<CR>") -- open floating terminal window
setkey({ "n", "v" }, "<leader>~", ":tabnew | term<CR>") -- open terminal in new tab

setkey({ "n", "v" }, "<leader>tn", ":tabnew<CR>") -- open new tab
