local map = vim.keymap.set

-- 1. Toggle relative line numbers
function ToggleRelativeLineNumbers()
  vim.wo.relativenumber = not vim.wo.relativenumber
end
map(
  "n",
  "<leader>ro",
  ToggleRelativeLineNumbers,
  { noremap = true, silent = true, desc = "Toggle Relative Line Numbers" }
)

-- 2. Add line below / above cursor
map("n", "<leader>o", "m`o<Esc>``", { noremap = true, silent = true, desc = "Add Line Below Cursor" })
map("n", "<leader>O", "m`O<Esc>``", { noremap = true, silent = true, desc = "Add Line Above Cursor" })

vim.keymap.set("n", "<leader>rc", function()
  if vim.g.copilot_enabled then
    vim.g.copilot_enabled = false
    vim.notify("Copilot Disabled", vim.log.levels.INFO)
  else
    vim.g.copilot_enabled = true
    vim.notify("Copilot Enabled", vim.log.levels.INFO)
  end
end, { desc = "Toggle Copilot" })

-- 3.
vim.keymap.set("n", "<leader>rf", function()
  require("telescope.builtin").find_files({ search_dirs = { "/" } })
end, { desc = "Find Files in Whole System" })
