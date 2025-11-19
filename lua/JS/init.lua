vim.g.mapleader = " " -- Set leader key before Lazy
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree", silent = true })

require("JS.lazy_init")
require("JS.set")
require("JS.remap")

