local k = vim.keymap
local opts = { noremap = true, silent = true }

-- Editor
k.set("n", "<leader>qq", ":qa<CR>", opts) -- Quit Editor
k.set("n", "<leader>rn", ":set relativenumber!<CR>", opts) -- Toggle Relative Number
k.set("n", "<C-a>", "ggVG", opts) -- Select all
k.set("n", "+", "<C-a>", opts) -- Increment
k.set("n", "-", "<C-x>", opts) -- Decrement
k.set("n", "n", "nzz", opts) -- Center Search
k.set("n", "N", "Nzz", opts) -- Center Search
k.set("n", "<C-d>", "<C-d>zz", opts) -- Page Down Center
k.set("n", "<C-u>", "<C-u>zz", opts) -- Page Up Center

-- Lazy & Mason
k.set("n", "<leader>ll", ":Lazy<CR>", opts) -- Open Lazy
k.set("n", "<leader>mm", ":Mason<CR>", opts) -- Open Mason

-- Directory Navigation
k.set("n", "<leader>ee", ":NvimTreeToggle<CR>", opts) -- Toggle NvimTree
k.set("n", "<leader>ef", ":NvimTreeFocus<CR>", opts) -- Focus NvimTree

-- Pane Navigation
k.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
k.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
k.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
k.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right

-- Window Management
k.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Vertical Split
k.set("n", "<leader>sh", ":split<CR>", opts) -- Horizontal Split
k.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Maximize Toggle

-- Indenting
k.set("v", ">", ">gv", opts) -- Indent
k.set("v", "<", "<gv", opts) -- Outdent
