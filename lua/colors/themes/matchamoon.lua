return function()
	local colors = {
		bg = "#2e3a30", -- Cool slate green (night forest base)
		fg = "#cde7cf", -- Pale misty matcha foam
		selection_bg = "#3e4f42", -- Slightly lifted leaf tone
		selection_fg = "#eafbe1",
		inactive_fg = "#809780", -- Dimmed sage
		positive = "#a5f5c1", -- Mint mist
		negative = "#e58e8e", -- Moonlight red
		neutral = "#e7d8a2", -- Light sesame oat
		link = "#89d3c4", -- Dewy cyan-green
		bar_bg = "#374339", -- Charcoal green bar
		bar_fg = "#cde7cf", -- Same as foreground (calm consistency)
	}

	-- Core UI
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

	-- Status line
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

	-- Tabs
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
