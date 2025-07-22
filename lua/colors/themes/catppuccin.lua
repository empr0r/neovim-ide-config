return function()
local colors = {
	bg = "#1e1e2e",             -- Base background (mocha)
	fg = "#cdd6f4",             -- Text (lavender-tinged white)
	selection_bg = "#313244",  -- Subtle selection highlight
	selection_fg = "#cdd6f4",
	inactive_fg = "#6c7086",   -- Comments and dimmed text
	positive = "#a6e3a1",       -- Green (success)
	negative = "#f38ba8",       -- Red (error)
	neutral  = "#f9e2af",       -- Yellow (warn)
	link     = "#89b4fa",       -- Blue (link)
	bar_bg = "#181825",         -- Status/tabline background
	bar_fg = "#cdd6f4",         -- Foreground
}

-- General UI
vim.cmd("highlight Normal guibg=" .. colors.bg .. " guifg=" .. colors.fg)
vim.cmd("highlight Visual guibg=" .. colors.selection_bg .. " guifg=" .. colors.selection_fg)
vim.cmd("highlight Comment guifg=" .. colors.inactive_fg)
vim.cmd("highlight String guifg=" .. colors.positive)
vim.cmd("highlight Error guifg=" .. colors.negative .. " guibg=" .. colors.bg)
vim.cmd("highlight Warning guifg=" .. colors.neutral .. " guibg=" .. colors.bg)
vim.cmd("highlight Identifier guifg=" .. colors.link)
vim.cmd("highlight LineNr guifg=" .. colors.inactive_fg .. " guibg=" .. colors.bg)
vim.cmd("highlight CursorLineNr guifg=" .. colors.fg .. " guibg=" .. colors.bg)
vim.cmd("highlight Pmenu guibg=" .. colors.bg .. " guifg=" .. colors.fg)
vim.cmd("highlight PmenuSel guibg=" .. colors.selection_bg .. " guifg=" .. colors.fg)

-- Status Line
vim.cmd("highlight StatusLine guibg=" .. colors.bar_bg .. " guifg=" .. colors.bar_fg)
vim.cmd("highlight StatusLineNC guibg=" .. colors.bar_bg .. " guifg=" .. colors.inactive_fg)

-- Tabline
vim.cmd("highlight TabLine guibg=" .. colors.bar_bg .. " guifg=" .. colors.inactive_fg)
vim.cmd("highlight TabLineSel guibg=" .. colors.selection_bg .. " guifg=" .. colors.fg)
vim.cmd("highlight TabLineFill guibg=" .. colors.bg)

-- GitSigns
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.positive })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.neutral })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.negative })

-- BufferLine
local utils = require("colors.utils")
pcall(function()
require("bufferline").setup({
	highlights = utils.bufferline_highlights(colors),
})
end)

return colors
end
