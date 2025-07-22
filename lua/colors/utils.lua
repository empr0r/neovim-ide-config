local M = {}

-- Used for bufferline highlight integration
function M.bufferline_highlights(colors)
return {
	fill = { bg = colors.bar_bg },

	background = {
		fg = colors.inactive_fg,
		bg = colors.bar_bg,
	},

	tab = {
		fg = colors.inactive_fg,
		bg = colors.bar_bg,
	},

	tab_selected = {
		fg = colors.fg,
		bg = colors.selection_bg,
		bold = true,
	},

	tab_separator = {
		fg = colors.bar_bg,
		bg = colors.bar_bg,
	},

	tab_separator_selected = {
		fg = colors.selection_bg,
		bg = colors.selection_bg,
	},

	indicator_selected = {
		fg = colors.fg,
		bg = colors.selection_bg,
	},

	buffer_selected = {
		fg = colors.fg,
		bg = colors.selection_bg,
		bold = true,
		italic = true,
	},

	buffer_visible = {
		fg = colors.inactive_fg,
		bg = colors.bar_bg,
	},

	close_button = {
		fg = colors.inactive_fg,
		bg = colors.bar_bg,
	},

	close_button_selected = {
		fg = colors.fg,
		bg = colors.selection_bg,
	},

	modified = {
		fg = colors.neutral,
		bg = colors.bar_bg,
	},

	modified_selected = {
		fg = colors.neutral,
		bg = colors.selection_bg,
	},
}
end

return M
