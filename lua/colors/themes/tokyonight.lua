return function()
local colors = {
	bg = "#1a1b26",           -- Night background
	fg = "#c0caf5",           -- Soft foreground
	selection_bg = "#33467c", -- Visual selection
	selection_fg = "#ffffff",
	inactive_fg = "#565f89", -- Comment gray
	positive = "#9ece6a",     -- Green (diff adds, strings)
	negative = "#f7768e",     -- Red (errors, delete)
	neutral = "#e0af68",      -- Yellow (warnings)
	link = "#7aa2f7",         -- Blue (functions, links)
	bar_bg = "#16161e",       -- Status/tab bar
	bar_fg = "#c0caf5",
}

-- Core UI
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

-- StatusLine & Tabline
vim.cmd("highlight StatusLine guibg=" .. colors.bar_bg .. " guifg=" .. colors.bar_fg)
vim.cmd("highlight StatusLineNC guibg=" .. colors.bar_bg .. " guifg=" .. colors.inactive_fg)
vim.cmd("highlight TabLine guibg=" .. colors.bar_bg .. " guifg=" .. colors.inactive_fg)
vim.cmd("highlight TabLineSel guibg=" .. colors.selection_bg .. " guifg=" .. colors.fg)
vim.cmd("highlight TabLineFill guibg=" .. colors.bg)

-- GitSigns
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.positive })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.neutral })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.negative })

-- nvim-tree
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = colors.bg, fg = colors.fg })
vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = colors.bg, fg = colors.fg })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { fg = colors.bg })
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = colors.link })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = colors.link, bold = true })
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = colors.inactive_fg })
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = colors.link })
vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = colors.neutral, bold = true })
vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = colors.positive })
vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = colors.neutral })
vim.api.nvim_set_hl(0, "NvimTreeImageFile", { fg = colors.fg })
vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = colors.link })

-- Bufferline
local ok, utils = pcall(require, "colors.utils")
if ok then
	pcall(function()
	require("bufferline").setup({
		highlights = utils.bufferline_highlights(colors),
	})
	end)
	end

	return colors
	end
