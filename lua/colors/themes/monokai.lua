return function()
local colors = {
	bg = "#272822",             -- Background (dark olive gray)
	fg = "#f8f8f2",             -- Default text (off-white)
	selection_bg = "#49483e",  -- Selection background (slightly lighter olive)
	selection_fg = "#f8f8f2",  -- Keep text readable
	inactive_fg = "#75715e",   -- Comments / Inactive text (muted olive)
	positive = "#a6e22e",       -- Green
	negative = "#f92672",       -- Pinkish red
	neutral  = "#fd971f",       -- Orange-yellow
	link     = "#66d9ef",       -- Cyan
	bar_bg = "#1e1f1c",         -- Statusline/Tabline background
	bar_fg = "#f8f8f2",         -- Foreground (same as normal text)
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
