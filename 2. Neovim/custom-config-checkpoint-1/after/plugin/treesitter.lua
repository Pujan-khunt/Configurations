require("nvim-treesitter.configs").setup {
	-- Languages for which treesitter will be downloaded.
	ensure_installed = { "java", "go", "lua", "javascript", "typescript", "html", "css", "python", "c", "cpp" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			node_decremental = "grm",
		},
	},
}
