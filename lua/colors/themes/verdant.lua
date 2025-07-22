return function()
	local colors = {
		bg = "#0f1410", -- Deep dark green-black
		fg = "#9de09d", -- Manjaro leaf green (primary text)
		selection_bg = "#1c2b1e", -- Muted forest green
		selection_fg = "#d0ffd0",
		inactive_fg = "#5e7f5e", -- Dimmed moss
		positive = "#00ff87", -- Vibrant mint green
		negative = "#ff6f6f", -- High-contrast red
		neutral = "#e5c07b", -- Tan yellow
		link = "#7ad2b0", -- Minty teal
		bar_bg = "#16261c", -- Slightly brighter dark green
		bar_fg = "#b7fdb2", -- Neon greenish white
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
