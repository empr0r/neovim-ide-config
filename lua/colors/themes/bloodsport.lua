return function()
local colors = {
    bg = "#0a0000",            -- Near-black with a hint of dried blood
    fg = "#ffdad5",            -- Pale skin tone / wounded highlight
    selection_bg = "#360000", -- Deep dark red for visual select
    selection_fg = "#ffffff", -- White text over selection
    inactive_fg = "#8b6f6a",  -- Faded blood/bandage gray
    positive = "#a3ffa1",     -- Glowing green (to stand out in chaos)
    negative = "#ff1e1e",     -- Bright arterial red
    neutral = "#e09600",      -- Mustard brass (old trophies)
    link = "#f44283",         -- Neon magenta/pink
    bar_bg = "#190000",       -- Slightly lighter than bg for tab/status
    bar_fg = "#ff8888",       -- Desaturated soft red
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

-- Statusline
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
