-- Load general settings
require("settings") -- Configure Neovim options (e.g., line numbers, tab settings)

-- Load key mappings
require("mappings") -- Configure custom key mappings

-- Load colorscheme
require("colors.theme")

-- Bootstrap Lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- Use the latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup("plugins")

-- Beautifier setup using null-ls.nvim
require("null-ls").setup({
	sources = {
		-- Prettier for JavaScript, HTML, CSS, etc.
		require("null-ls").builtins.formatting.prettier.with({
			command = "./node_modules/.bin/prettier", -- Use local Prettier
		}),

		-- Black for Python
		require("null-ls").builtins.formatting.black.with({
			command = vim.fn.stdpath("config") .. "/.venv/bin/black", -- Use local Black
			extra_args = { "--line-length", "88" },
		}),

		-- shfmt for Bash
		require("null-ls").builtins.formatting.shfmt.with({
			extra_args = { "-i", "4" }, -- Indent with 4 spaces
		}),
	},
})

require("lspconfig").rust_analyzer.setup({})

vim.api.nvim_create_user_command("SetTransparency", function(opts)
	require("colors.transparency").set(opts.args)
end, {
	nargs = 1,
	desc = "Set transparency between 0.0 and 1.0",
})

-- Format on save
vim.cmd([[
    augroup FormatOnSave
        autocmd!
        autocmd BufWritePre *.sh,*.js,*.css,*.html,*.py,*.lua lua vim.lsp.buf.format({ async = false })
    augroup END
]])
