return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        layout_config = {
          horizontal = { preview_width = 0.6 },
        },
        file_ignore_patterns = { "node_modules", ".git" },
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>rf", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>rg", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>rb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>rh", builtin.help_tags, { desc = "Find Help Tags" })
    vim.keymap.set("n", "<leader>rh", function()
      require("telescope.builtin").find_files({
        search_dirs = { os.getenv("HOME") },
        hidden = true,
        no_ignore = true,
      })
    end, { desc = "🔍 Search All Files in ~/" })
    vim.keymap.set("n", "<leader>rr", function()
      require("telescope.builtin").find_files({
        search_dirs = { "/" },
        hidden = true,
        no_ignore = true,
      })
    end, { desc = "🔍 Search All Files in / (root)" })
  end,
}
