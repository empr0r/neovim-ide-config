return function()
local colors = {
	bg = "#2E3440",          -- Polar Night 1
	fg = "#D8DEE9",          -- Snow Storm 1
	selection_bg = "#434C5E", -- Polar Night 2
	selection_fg = "#ECEFF4", -- Snow Storm 2
	inactive_fg = "#4C566A",  -- Polar Night 3
	positive = "#A3BE8C",    -- Frost Green
	negative = "#BF616A",    -- Red
	neutral  = "#EBCB8B",    -- Yellow
	link     = "#81A1C1",    -- Blue
	bar_bg = "#3B4252",      -- Polar Night 4
	bar_fg = "#D8DEE9",
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
