local M = {}

local utils = require("colors.utils")
local config_path = vim.fn.stdpath("config") .. "/theme.json"

-- Load theme from theme.json
local function load_theme()
	local file = io.open(config_path, "r")
	if file then
		local content = file:read("*a")
		file:close()
		local ok, result = pcall(vim.fn.json_decode, content)
		if ok and result and result.name then
			return result.name
		end
	end
	return "default"
end

-- Save theme to theme.json
local function save_theme(name)
	local config = { name = name }
	local file = io.open(config_path, "w")
	if file then
		file:write(vim.fn.json_encode(config))
		file:close()
	end
end

-- List of available themes
local themes = {
	"default", -- Always first

	-- Warm reds & browns
	"aperture",
	"bloodsport",
	"claret",
	"ronin",
	"cafe",
	"cafeexpresso",

	-- Greens / nature tones
	"everforest",
	"verdant",
	"matcha",
	"matchamoon",

	-- Purples / pinks / off-neutrals
	"nebula",
	"catppuccin",
	"dracula",
	"monokai",

	-- Blues / cool tones
	"sapphire",
	"nord",
	"tokyonight",
	"tokyonightmoon",

	-- Mixed / traditional palettes
	"gruvbox",
	"solarized",
	"oxocarbon",
}

local current_index = 1

local function apply_theme(name)
	vim.notify("Switching to theme: " .. name)
	local ok, theme = pcall(require, "colors.themes." .. name)
	if not ok or type(theme) ~= "function" then
		vim.notify("Failed to load theme: " .. name, vim.log.levels.ERROR)
		return
	end

	local colors = theme() -- apply theme and get color table
	save_theme(name)

	-- Refresh lualine and bufferline
	pcall(function()
		require("lualine").setup({})
	end)

	pcall(function()
		require("bufferline").setup({
			highlights = utils.bufferline_highlights(colors),
		})
	end)
end

local function next_theme()
	current_index = (current_index % #themes) + 1
	apply_theme(themes[current_index])
end

local function set_theme(name)
	for i, theme in ipairs(themes) do
		if theme == name then
			current_index = i
			apply_theme(name)
			return
		end
	end
	vim.notify("Theme not found: " .. name, vim.log.levels.WARN)
end

M.themes = themes
M.set = set_theme
M.next = next_theme
M.apply = apply_theme
M.load = function()
	local last = load_theme()
	set_theme(last)
end

return M
