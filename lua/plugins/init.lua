-- Plugin configuration
return {
	-- Plugin manager
	{ "folke/lazy.nvim" },

	-- Core plugins
	{ "nvim-lua/plenary.nvim" }, -- Utility functions used by many plugins

	-- UI Enhancements
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "python", "javascript" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
						},
					},
				},
			})
		end,
	},
	{
		"kyazdani42/nvim-web-devicons", -- File icons
	},

	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		lazy = false, -- Eager-load on startup
		priority = 1000, -- Load after theme sets base groups
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					themable = true,
					separator_style = "slant",
				},
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = { theme = "auto" }, -- Automatically adjusts to the KDE theme colors
			})
		end,
	},

	-- File Explorer
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	-- Git Integration
	{ "tpope/vim-fugitive" }, -- Git commands
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		config = function()
			require("git-conflict").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "|" },
					change = { text = "|" },
					delete = { text = "_" },
				},
				current_line_blame = true,
			})
		end,
	},

	-- LSP and Autocompletion
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- Setup Mason
			require("mason").setup()

			-- Setup Mason-LSPconfig
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "ts_ls" }, -- Automatically install these LSPs
			})

			-- Configure LSP servers
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- TypeScript and JavaScript LSP (ts_ls)
			lspconfig.ts_ls.setup({
				on_attach = function(client, bufnr)
					-- Example: Key mappings for LSP
					local bufopts =
						{ noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				end,
				capabilities = capabilities,
			})

			-- Python LSP (Pyright)
			lspconfig.pyright.setup({
				on_attach = function(client, bufnr)
					-- Example: Key mappings for LSP
					local bufopts =
						{ noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
					print("Pyright LSP attached.") -- Debugging message
				end,
				capabilities = capabilities,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				mapping = {
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
	{ "hrsh7th/cmp-buffer" }, -- Buffer completions
	{ "hrsh7th/cmp-path" }, -- Path completions
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip").setup({})
		end,
	},
	{ "saadparwaiz1/cmp_luasnip" }, -- Snippet completions
	{
		"nvimdev/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("lspsaga").setup({})
		end,
	},
	-- Debugging
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.python = {
				type = "executable",
				command = "/usr/bin/python",
				args = { "-m", "debugpy.adapter" },
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end,
	},
	{
		"nvim-neotest/nvim-nio", -- Required for nvim-dap-ui
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},

	-- Productivity
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- Prettier for JavaScript, HTML, CSS, etc.
					null_ls.builtins.formatting.prettier.with({
						command = "./node_modules/.bin/prettier",
					}),

					-- Black for Python
					null_ls.builtins.formatting.black.with({
						command = vim.fn.stdpath("config")
							.. "/.venv/bin/black",
						extra_args = { "--line-length", "88" },
					}),

					-- shfmt for Bash
					null_ls.builtins.formatting.shfmt.with({
						extra_args = { "-i", "4" }, -- Indent with 4 spaces
					}),

					-- Stylua for Lua
					null_ls.builtins.formatting.stylua.with({
						extra_args = {
							"--indent-width",
							"4", -- Set indent width to 4 spaces
							"--column-width",
							"80", -- Set max column width
						},
					}),
				},
			})
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		config = function()
			require("spectre").setup({})
		end,
	},
	-- Markdown and Writing
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		config = function()
			vim.cmd([[let g:mkdp_auto_start = 1]])
		end,
		opts = {},
		-- Tell Lazy to fucking skip checking local git state
		dev = false,
		cond = function()
			vim.fn.system(
				"rm -f ~/.local/share/nvim/lazy/markdown-preview.nvim/app/yarn.lock"
			)
			return true
		end,
	},
	{ "dhruvasagar/vim-table-mode" },

	-- Diagnostics
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("trouble").setup({})
		end,
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				size = 20, -- Height of the terminal window
				open_mapping = [[<C-\>]], -- Keybinding to toggle the terminal
				direction = "horizontal", -- Options: "horizontal", "vertical", "tab", "float"
				shading_factor = 2, -- Darken the terminal by 2 steps
				shell = vim.o.shell, -- Use default shell
				persist_size = true, -- Remember terminal size
				close_on_exit = true, -- Close terminal when process exits
			})
		end,
	},
}
