local path = vim.fn.stdpath("config") .. "/theme.json"

local function load_config()
	local file = io.open(path, "r")

	-- If missing, create it
	if not file then
		local default_config = {
			name = "default",
			transparency = nil,
		}
		local out = io.open(path, "w")
		if out then
			out:write(vim.fn.json_encode(default_config))
			out:close()
			vim.notify(
				"Created theme.json with default theme",
				vim.log.levels.INFO
			)
		end
		return default_config
	end

	-- Load config
	local content = file:read("*a")
	file:close()

	local ok, result = pcall(vim.fn.json_decode, content)
	return ok and result or {}
end

return load_config()
