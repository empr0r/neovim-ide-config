return function()
local colors = {
	bg = "#0C1E12",          -- Deep forest green
	fg = "#D9F5C9",          -- Soft leaf cream
	selection_bg = "#1A3321",-- Mossy highlight
	selection_fg = "#E1FFD5",
	inactive_fg = "#6E8B7B", -- Dusty pine
	positive = "#A3E8BA",    -- Fresh mint
	negative = "#E57373",    -- Faded berry
	neutral = "#F1C27B",     -- Light bark
	link = "#8AB6D6",        -- Sky-reflecting stream
	bar_bg = "#132D1A",      -- Canopy shadows
	bar_fg = "#D9F5C9",
}

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
vim.cmd("highlight StatusLine guibg=" .. colors.bar_bg .. " guifg=" .. colors.bar_fg)
vim.cmd("highlight StatusLineNC guibg=" .. colors.bar_bg .. " guifg=" .. colors.inactive_fg)
vim.cmd("highlight TabLine guibg=" .. colors.bar_bg .. " guifg=" .. colors.inactive_fg)
vim.cmd("highlight TabLineSel guibg=" .. colors.selection_bg .. " guifg=" .. colors.fg)
vim.cmd("highlight TabLineFill guibg=" .. colors.bg)

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

return colors
end
