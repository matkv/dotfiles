-- Leader keys — must be set before any plugin loads
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options
local o = vim.o
local opt = vim.opt

o.termguicolors = true
o.number = true
o.mouse = "a"
o.showmode = false -- lualine shows the mode already
o.clipboard = "unnamedplus"
o.breakindent = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.cursorline = true
o.scrolloff = 5
o.updatetime = 250
o.timeoutlen = 300 -- faster which-key popup
o.splitright = true
o.splitbelow = true
o.list = true
o.inccommand = "split" -- live preview for :s substitutions
o.hlsearch = true
o.wrap = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.textwidth = 80

opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- use new UI for nvim 0.12 - prevents some "Press ENTER" interactions
require('vim._core.ui2').enable({})

-- Diagnostics
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
	virtual_text = true,
})

-- Core keymaps (no plugins required)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "gh", "^", { desc = "Go to line start" })
vim.keymap.set("n", "gl", "$", { desc = "Go to line end" })

-- Colorscheme
vim.pack.add({ "https://github.com/sainnhe/gruvbox-material" }, { confirm = false })
vim.cmd.colorscheme("gruvbox-material")

-- Treesitter — syntax highlighting and code parsing
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { confirm = false })

vim.treesitter.language.add("json", { filetype = "jsonc" })

require("nvim-treesitter").setup({
	ensure_installed = { "lua", "c", "rust", "go" },
	auto_install = true,
	highlight = { enable = not vim.g.vscode },
})

-- Completion (blink.cmp)
vim.pack.add({ "https://github.com/saghen/blink.cmp" }, { confirm = false })

require("blink.cmp").setup({
	completion = {
		documentation = { auto_show = true },
	},
	keymap = {
		["<C-n>"] = { "select_next", "fallback_to_mappings" },
		["<C-p>"] = { "select_prev", "fallback_to_mappings" },
		["<C-y>"] = { "select_and_accept", "fallback" },
		["<C-e>"] = { "cancel", "fallback" },
		["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
		["<CR>"] = { "select_and_accept", "fallback" },
		["<Esc>"] = { "cancel", "hide_documentation", "fallback" },
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
	},
	fuzzy = { implementation = "lua" },
})

-- LSP (mason + mason-lspconfig + nvim-lspconfig)
local lsp_servers = {
	lua_ls = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("lua", true),
			},
		},
	},
}

vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
}, { confirm = false })

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = vim.tbl_keys(lsp_servers),
})

-- attach keymaps and per-server settings when an LSP client connects
for server, config in pairs(lsp_servers) do
	vim.lsp.config(server, {
		settings = config,
		on_attach = function(_, bufnr)
			-- navigation
			vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buf = bufnr, desc = "Go to definition" })
			vim.keymap.set("n", "grr", vim.lsp.buf.references, { buf = bufnr, desc = "Go to references" })
			vim.keymap.set("n", "grf", vim.lsp.buf.format, { buf = bufnr, desc = "Format buffer" })
			-- actions
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buf = bufnr, desc = "[R]e[n]ame symbol" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ buf = bufnr, desc = "[C]ode [A]ction" }
			)
			-- diagnostics
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { buf = bufnr, desc = "Open diagnostic float" })
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1 })
			end, { buf = bufnr, desc = "Next diagnostic" })
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1 })
			end, { buf = bufnr, desc = "Previous diagnostic" })
		end,
	})
end

-- Telescope — fuzzy finder
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- required library
	"https://github.com/nvim-tree/nvim-web-devicons", -- nerd font icons
	"https://github.com/nvim-telescope/telescope.nvim",
}, { confirm = false })

require("telescope").setup({})

local pickers = require("telescope.builtin")

vim.keymap.set("n", "<leader><leader>", pickers.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>sg", pickers.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sb", pickers.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "<leader>sh", pickers.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", pickers.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sr", pickers.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>sm", pickers.man_pages, { desc = "[S]earch [M]anuals" })
vim.keymap.set("n", "<leader>sd", pickers.diagnostics, { desc = "[S]earch [D]iagnostics" })

-- UI — lualine (statusline + buffer tabline)
vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" }, { confirm = false })

require("lualine").setup({
	options = {
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				show_filename_only = true,
				show_modified_status = true,
				mode = 2, -- show buffer name + index
				symbols = {
					modified = " ●",
					alternate_file = "",
					directory = "",
				},
			},
		},
	},
})

vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "[B]uffer [D]elete" })

-- Which-key — keybind overview and leader group labels
-- must come after all keymaps so it can annotate them
vim.pack.add({ "https://github.com/folke/which-key.nvim" }, { confirm = false })

require("which-key").add({
	{ "<leader>s", group = "[S]earch", icon = { icon = "󰍉", color = "blue" } },
	{ "<leader>b", group = "[B]uffer", icon = { icon = "󰈙", color = "cyan" } },
	{ "<leader>r", group = "[R]ename", icon = { icon = "󰑕", color = "orange" } },
	{ "<leader>c", group = "[C]ode", icon = { icon = "󰅪", color = "green" } },
	{ "<leader>m", group = "[M]ason", icon = { icon = "󰏗", color = "purple" } },
	{ "<leader>l", group = "[L]SP", icon = { icon = "󰒕", color = "yellow" } },
	{ "<leader>q", group = "[Q]uit", icon = { icon = "", color = "red" } },
	{ "<leader>p", group = "[P]ackages", icon = { icon = "󰏖", color = "blue" } },
	{ "<leader>u", group = "[U]ser interface", icon = { icon = "󰕮", color = "cyan" } },
})

-- Mason
vim.keymap.set("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Open [M]ason" })

-- LSP utilities
vim.keymap.set("n", "<leader>li", function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		vim.notify("No LSP clients attached to this buffer", vim.log.levels.WARN)
	else
		local names = vim.tbl_map(function(c)
			return c.name
		end, clients)
		vim.notify("LSP clients: " .. table.concat(names, ", "), vim.log.levels.INFO)
	end
end, { desc = "[L]SP [I]nfo" })

vim.keymap.set("n", "<leader>lr", function()
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
		client:stop()
	end
	vim.cmd("edit")
end, { desc = "[L]SP [R]estart" })

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<CR>", { desc = "[Q]uit all (without saving)" })
vim.keymap.set("n", "<leader>qs", "<cmd>wa<CR>", { desc = "[Q]uick [S]ave all" })

-- Packages
vim.keymap.set("n", "<leader>pu", function()
	vim.pack.update()
end, { desc = "[P]ackages [U]pdate" })

-- Utilities

-- auto-close brackets and quotes
vim.pack.add({ "https://github.com/windwp/nvim-autopairs" }, { confirm = false })
require("nvim-autopairs").setup()

-- highlight TODO / FIXME / WARN / NOTE / HACK / PERF comments
vim.pack.add({ "https://github.com/folke/todo-comments.nvim" }, { confirm = false })
require("todo-comments").setup()

-- flash — fast motion and jump to any location
vim.pack.add({ "https://github.com/folke/flash.nvim" }, { confirm = false })
require("flash").setup({})

vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash jump" })
vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash treesitter" })
vim.keymap.set("o", "r", function()
	require("flash").remote()
end, { desc = "Flash remote" })
vim.keymap.set({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Flash treesitter search" })
vim.keymap.set("c", "<C-s>", function()
	require("flash").toggle()
end, { desc = "Toggle flash search" })

-- User Interface
vim.keymap.set("n", "<leader>uw", function()
	vim.o.wrap = not vim.o.wrap
	vim.notify("Word wrap " .. (vim.o.wrap and "enabled" or "disabled"))
end, { desc = "[U]I toggle [W]ord wrap" })

vim.keymap.set("n", "<leader>ul", function()
	vim.o.number = not vim.o.number
	vim.notify("Line numbers " .. (vim.o.number and "enabled" or "disabled"))
end, { desc = "[U]I toggle [L]ine numbers" })
