function colorify(theme)
	-- Fallback value is "github_dark_default"
	theme = theme or "github_dark_default";
	vim.cmd.colorscheme(theme);

	-- Highlight Groups
	-----------------------------------------------------------------------------------------
	-- 1. Editor
	local editor_hl_groups = {
		"Normal",
		"NormalFloat"
	}

	for i=1, #editor_hl_groups do
		vim.api.nvim_set_hl(0, editor_hl_groups[i], { bg = "none" })
	end

	-- 2. netrw UI elements
	vim.api.nvim_set_hl(0, "Directory", { fg = "#58a6ff", bg = "none" }) -- folder names
	vim.api.nvim_set_hl(0, "File", { fg = "#2a6a8d", bg = "none" }) -- folder names
	vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "none", bg = "none" })  -- ~ symbols at end
	vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })                -- split borders

	-- 3. Telescope Highlights
	vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeResultsMethod", { bg = "none" })


	-----------------------------------------------------------------------------------------
end

-- colorify();
vim.cmd.colorscheme("github_dark_default");
