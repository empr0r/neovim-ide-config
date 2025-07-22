-- Set the leader key
vim.g.mapleader = " " -- Space bar as the leader key

-- Options for key mappings
local opts = { noremap = true, silent = true }

-- Helper function for key mappings
local map = vim.api.nvim_set_keymap

-- General Shortcuts
map("n", "<Leader>w", ":w<CR>", opts) -- Save file
map("n", "<Leader>q", ":q<CR>", opts) -- Quit Neovim
map("n", "<Leader>x", ":x<CR>", opts) -- Save and quit
map("n", "<Leader>c", ":bdelete<CR>", opts) -- Close buffer

-- Nano-like Keybindings
map("n", "<C-o>", ":w<CR>", opts) -- Save
map("n", "<C-x>", ":q<CR>", opts) -- Quit
map("n", "<C-k>", "dd", opts) -- Cut current line
map("n", "<C-u>", "p", opts) -- Paste
map("n", "<C-w>", "/", opts) -- Search
map("n", "<C-z>", "u", opts) -- Undo
map("n", "<M-e>", "<C-r>", opts) -- Redo (Alt+E)
map("n", "<C-a>", "0", opts) -- Move to start of line
map("n", "<C-e>", "$", opts) -- Move to end of line

-- Window Navigation
map("n", "<C-h>", "<C-w>h", opts) -- Move to the left window
map("n", "<C-l>", "<C-w>l", opts) -- Move to the right window
map("n", "<C-j>", "<C-w>j", opts) -- Move to the window below
map("n", "<C-k>", "<C-w>k", opts) -- Move to the window above

-- Window Resizing
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer Navigation
map("n", "<S-l>", ":bnext<CR>", opts) -- Go to the next buffer
map("n", "<S-h>", ":bprevious<CR>", opts) -- Go to the previous buffer

-- File Explorer (nvim-tree)
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope Mappings
map("n", "<Leader>f", ":Telescope find_files<CR>", opts) -- Find files
map("n", "<Leader>g", ":Telescope live_grep<CR>", opts) -- Live grep
map("n", "<Leader>b", ":Telescope buffers<CR>", opts) -- List buffers
map("n", "<Leader>h", ":Telescope help_tags<CR>", opts) -- Help tags

-- LSP Mappings
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- Hover documentation
map("n", "gr", "<cmd>Lspsaga finder<CR>", opts) -- References (Lspsaga)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- Go to implementation
map("n", "<Leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- Rename (Lspsaga)
map("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Code actions
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts) -- Previous diagnostic
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts) -- Next diagnostic
map("n", "<Leader>dl", "<cmd>Telescope diagnostics<CR>", opts) -- List diagnostics

-- Debugging (DAP)
map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts) -- Start/continue debugging
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opts) -- Step over
map("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opts) -- Step into
map("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", opts) -- Step out
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts) -- Toggle breakpoint
map("n", "<Leader>dc", "<cmd>lua require'dap'.clear_breakpoints()<CR>", opts) -- Clear breakpoints
map("n", "<Leader>du", "<cmd>lua require'dapui'.toggle()<CR>", opts) -- Toggle DAP UI

-- Git Integration (Fugitive and Gitsigns)
map("n", "<Leader>gs", ":Git<CR>", opts) -- Open Git status
map("n", "<Leader>gp", ":Git push<CR>", opts) -- Push changes
map("n", "<Leader>gl", ":Git pull<CR>", opts) -- Pull changes
map("n", "]g", "<cmd>lua require'gitsigns'.next_hunk()<CR>", opts) -- Next Git hunk
map("n", "[g", "<cmd>lua require'gitsigns'.prev_hunk()<CR>", opts) -- Previous Git hunk
map("n", "<Leader>hp", "<cmd>lua require'gitsigns'.preview_hunk()<CR>", opts) -- Preview hunk
map("n", "<Leader>hs", "<cmd>lua require'gitsigns'.stage_hunk()<CR>", opts) -- Stage hunk
map("n", "<Leader>hr", "<cmd>lua require'gitsigns'.reset_hunk()<CR>", opts) -- Reset hunk

-- Markdown Preview
map("n", "<Leader>mp", ":MarkdownPreview<CR>", opts) -- Start Markdown preview
map("n", "<Leader>ms", ":MarkdownPreviewStop<CR>", opts) -- Stop Markdown preview

-- Quickfix and Location Lists
map("n", "<Leader>qo", ":copen<CR>", opts) -- Open quickfix list
map("n", "<Leader>qc", ":cclose<CR>", opts) -- Close quickfix list
map("n", "<Leader>lo", ":lopen<CR>", opts) -- Open location list
map("n", "<Leader>lc", ":lclose<CR>", opts) -- Close location list

-- Trouble key mappings
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", opts) -- Toggle diagnostics
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", opts) -- Buffer diagnostics
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", opts) -- Symbols
map(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
	opts
) -- LSP items
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", opts) -- Location list
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", opts) -- Quickfix list

-- Spectre (Search/Replace UI)
map("n", "<Leader>sr", "<cmd>lua require('spectre').open()<CR>", opts) -- Open Spectre
map("v", "<Leader>sr", "<cmd>lua require('spectre').open_visual()<CR>", opts) -- Open Spectre for selection

-- Commenting
map(
	"n",
	"<Leader>/",
	"<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
	opts
) -- Toggle comment (normal mode)
map(
	"v",
	"<Leader>/",
	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	opts
) -- Toggle comment (visual mode)

-- Toggle terminal
map("n", "<Leader>t", ":ToggleTerm<CR>", opts) -- Toggle terminal

-- Theme Switcher Keymap
vim.api.nvim_set_keymap(
	"n",
	"<C-t>",
	"<cmd>lua require('colors.theme_switcher').next()<CR>",
	{ noremap = true, silent = true }
)

-- :SetTheme <name> command
vim.api.nvim_create_user_command("SetTheme", function(opts)
	require("colors.theme_switcher").set(opts.args)
end, {
	nargs = 1,
	complete = function()
		return require("colors.theme_switcher").themes
	end,
})
