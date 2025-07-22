return function()
local colors = {
	bg = "#2B1B17",          -- Dark roasted espresso
	fg = "#D9BBA0",          -- Creamy beige foam
	selection_bg = "#3A2620",-- Slightly lighter roast
	selection_fg = "#F5E3C8",-- Frothed milk highlight
	inactive_fg = "#7E6653", -- Mocha dust
	positive = "#C8E6C9",    -- Mint leaf garnish
	negative = "#E06C75",    -- Burnt beans
	neutral = "#E5C07B",     -- Brown sugar
	link = "#88B3D9",        -- Blue ceramic mug
	bar_bg = "#1E130D",      -- Countertop woodgrain
	bar_fg = "#D9BBA0",
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

-- Status and Tabs
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

-- Bufferline (uses utils)
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
