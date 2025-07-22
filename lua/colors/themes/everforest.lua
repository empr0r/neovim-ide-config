return function()
	local colors = {
		bg = "#2b3339", -- Dark background
		fg = "#d3c6aa", -- Light text
		selection_bg = "#414b50", -- Visual selection
		selection_fg = "#d3c6aa",
		inactive_fg = "#7a8478", -- Grayed out/inactive
		positive = "#a7c080", -- Greenish
		negative = "#e67e80", -- Reddish
		neutral = "#dbbc7f", -- Yellowish
		link = "#7fbbb3", -- Cyan/blue
		bar_bg = "#3c474d", -- Slightly lighter than bg
		bar_fg = "#d3c6aa", -- Match fg
	}

	-- Apply general highlights
	vim.cmd("highlight Normal guibg=" .. colors.bg .. " guifg=" .. colors.fg)
	vim.cmd(
		"highlight Visual guibg="
			.. colors.selection_bg
			.. " guifg="
			.. colors.selection_fg
	)
	vim.cmd("highlight Comment guifg=" .. colors.inactive_fg)
	vim.cmd("highlight String guifg=" .. colors.positive)
	vim.cmd(
		"highlight Error guifg=" .. colors.negative .. " guibg=" .. colors.bg
	)
	vim.cmd(
		"highlight Warning guifg=" .. colors.neutral .. " guibg=" .. colors.bg
	)
	vim.cmd("highlight Identifier guifg=" .. colors.link)
	vim.cmd(
		"highlight LineNr guifg="
			.. colors.inactive_fg
			.. " guibg="
			.. colors.bg
	)
	vim.cmd(
		"highlight CursorLineNr guifg=" .. colors.fg .. " guibg=" .. colors.bg
	)
	vim.cmd("highlight Pmenu guibg=" .. colors.bg .. " guifg=" .. colors.fg)
	vim.cmd(
		"highlight PmenuSel guibg="
			.. colors.selection_bg
			.. " guifg="
			.. colors.fg
	)

	-- StatusLine
	vim.cmd(
		"highlight StatusLine guibg="
			.. colors.bar_bg
			.. " guifg="
			.. colors.bar_fg
	)
	vim.cmd(
		"highlight StatusLineNC guibg="
			.. colors.bar_bg
			.. " guifg="
			.. colors.inactive_fg
	)

	-- Tabline
	vim.cmd(
		"highlight TabLine guibg="
			.. colors.bar_bg
			.. " guifg="
			.. colors.inactive_fg
	)
	vim.cmd(
		"highlight TabLineSel guibg="
			.. colors.selection_bg
			.. " guifg="
			.. colors.fg
	)
	vim.cmd("highlight TabLineFill guibg=" .. colors.bg)

	-- GitSigns
	vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.positive })
	vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.neutral })
	vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.negative })

	return colors
end
