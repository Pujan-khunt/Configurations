-- Open netrw
vim.keymap.set("n", "<leader>jk", vim.cmd.Ex);
 
-- Move Lines ( Cant live without this )
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in middle while jumping up and down with C-d and C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz");
vim.keymap.set("n", "<C-u>", "<C-u>zz");

