return function()
	local colors = {
		bg = "#1F1A17", -- Deep chai brew
		fg = "#EBD5B3", -- Creamy steeped tea
		selection_bg = "#332D29", -- Brewed spice
		selection_fg = "#F3E3C3",
		inactive_fg = "#A6917D", -- Subtle nutmeg
		positive = "#B1DFA3", -- Mint leaf
		negative = "#E3785F", -- Burnt ginger
		neutral = "#D8B165", -- Turmeric blend
		link = "#A0B9D6", -- Porcelain mug
		bar_bg = "#2C2420", -- Wooden counter
		bar_fg = "#EBD5B3",
	}

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

	vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.positive })
	vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.neutral })
	vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.negative })

	return colors
end
