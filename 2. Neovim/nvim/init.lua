-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("autosave")
require("telescope")
require("markdownPreview")

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Indent by 2 spaces (change as per your style)
vim.opt.tabstop = 2 -- A tab is displayed as 2 spaces
