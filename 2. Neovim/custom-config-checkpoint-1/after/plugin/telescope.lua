local builtin = require("telescope.builtin");
local actions = require("telescope.actions");
local themes = require("telescope.themes");
local telescope = require("telescope");

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = actions.close,
      },
      n = {
        ["<C-q>"] = actions.close,
      },
    },
  },
})

vim.keymap.set("n", "<leader>fj", function() 
  builtin.find_files({
    hidden = true,
    file_ignore_patterns = { ".git/", "node_modules/", "generated/" }
  });
end, { desc = "Telescope find files {including hidden}." });
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Telescope git files." });
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep." });
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers." });
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope files opened previously." });

-- Open Telescope to Search in Neovim Config Directory
vim.keymap.set("n", "<leader>cf", function()
	builtin.find_files {
		cwd = vim.fn.stdpath("config");
	}
end, { desc = "Telescope Neovim Config Files." });

-- Close The Telescope Window ( Not Working As Intended :( )
vim.keymap.set("n", "<C-q>", function()
	actions.close(prompt_bufnr)
end, { desc = "Quit Telescope Window In Normal Mode." });

vim.keymap.set("i", "<C-q>", function()
	actions.close(prompt_bufnr)
end, { desc = "Quit Telescope Window In Insert Mode." });
