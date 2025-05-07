-- If Anything breaks delete this file. (TEST - Not Yet Verified)
-- Date of birth: April 8, 2025 17:54:00

local function save()
  if vim.g.autosave_enabled then
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_call(buf, function()
      vim.cmd("silent! write")
    end)
  end
end

local function toggle_autosave()
  if vim.fn.exists("g:autosave_enabled") == 0 then
    vim.g.autosave_enabled = true
  end

  if vim.g.autosave_enabled then
    vim.g.autosave_enabled = false
    vim.notify("Autosave disabled ❌")
  else
    vim.g.autosave_enabled = true
    vim.notify("Autosave enabled ✅")
  end
end

vim.api.nvim_create_augroup("AutoSave", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    save()
  end,
  pattern = "*",
  group = "AutoSave",
})

vim.keymap.set("n", "<leader>rs", toggle_autosave, { desc = "Toggle autosave" })
