return function()
	-- No theme applied: fall back to Neovim defaults
	local colors = {
		bg = "NONE",
		fg = "NONE",
		selection_bg = "NONE",
		selection_fg = "NONE",
		inactive_fg = "NONE",
		positive = "NONE",
		negative = "NONE",
		neutral = "NONE",
		link = "NONE",
		bar_bg = "NONE",
		bar_fg = "NONE",
	}

	-- Do not override highlights; just return the structure
	return colors
end
