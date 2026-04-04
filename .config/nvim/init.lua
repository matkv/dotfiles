local g = vim.g
local o = vim.o
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = " "

o.termguicolors = true
o.number = true
o.mouse = "a"
o.showmode = false
o.clipboard = "unnamedplus"
o.breakindent = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.cursorline = true
o.scrolloff = 5
o.updatetime = 250
o.timeoutlen = 300
o.splitright = true
o.splitbelow = true
o.list = true
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" } -- decide about this
o.inccommand = "split"
o.hlsearch = true
o.wrap = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.textwidth = 80

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
	virtual_text = true, -- show inline diagnostics
})

-- clear search highlights with <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "gh", "^", { desc = "Move to the beginning of the line" })
vim.keymap.set("n", "gl", "$", { desc = "Move to the end of the line" })

vim.pack.add({ "https://github.com/sainnhe/gruvbox-material" }, { confirm = false })
vim.cmd.colorscheme("gruvbox-material")

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { confirm = false })

vim.treesitter.language.add("json", { filetype = "jsonc" })

require("nvim-treesitter").setup({
	ensure_installed = {
		"lua",
		"c",
		"rust",
		"go",
	},

	auto_install = true,

	highlight = {
		enable = true,
	},
})

vim.pack.add({ "https://github.com/saghen/blink.cmp" }, { confirm = false })

require("blink.cmp").setup({
	completion = {
		documentation = {
			auto_show = true,
		},
	},

	keymap = {
		-- these are the default blink keymaps
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

	fuzzy = {
		implementation = "lua",
	},
})

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

-- configure each lsp server
for server, config in pairs(lsp_servers) do
	vim.lsp.config(server, {
		settings = config,

		on_attach = function(_, bufnr)
			vim.keymap.set("n", "grd", vim.lsp.buf.definition, { -- think about which keybind would be nice here
				buffer = bufnr,
				desc = "Go to definition",
			})

			vim.keymap.set("n", "grf", vim.lsp.buf.format, { -- think about which keybind would be nice here
				buffer = bufnr,
				desc = "Format buffer",
			})
		end,
	})
end

-- fuzzy finder
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- library dependency
	"https://github.com/nvim-tree/nvim-web-devicons", -- icons (nerd font)
	"https://github.com/nvim-telescope/telescope.nvim", -- the fuzzy finder
}, { confirm = false })

require("telescope").setup({})

local pickers = require("telescope.builtin")

vim.keymap.set("n", "<leader><leader>", pickers.find_files, { desc = "Find files TEST MATKO" })
-- TODO add remaining ones from the example
-- like searching the neovim help from a fuzzy picker and so on

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

vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" }) -- shift + l, next buffer
vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>", { desc = "Prev buffer" }) -- shift + h, previous buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" }) -- SPC + bd, close buffer

vim.pack.add({ "https://github.com/folke/which-key.nvim" }, { confirm = false })

local wk = require("which-key")

-- wk.add({
--   { "<leader>d", group = "Diagnostics" },
--   { "<leader>e", group = "Explorer" },
--   { "<leader>f", group = "Find" },
--   { "<leader>l", group = "Lazy panels" },
--   { "<leader>m", group = "Mason" },
--   { "<leader>n", group = "NoHighlight" },
--   { "<leader>p", group = "File Explorer" },
--   { "<leader>s", group = "Splits" },
--   { "<leader>t", group = "Tabs" },
--   { "<leader>w", group = "Workspace" },
--   { "<leader>x", group = "Trouble" },
-- })
--
-- require("which-key").setup({
--   spec = {
--     { "<leader>s", group = "[S]earch", icon = { icon = "", color = "green", }, },
--   }
-- })

vim.pack.add({
	"https://github.com/windwp/nvim-autopairs", -- auto pairs
	"https://github.com/folke/todo-comments.nvim", -- highlight TODO/INFO/WARN comments
}, { confirm = false })

require("nvim-autopairs").setup()
require("todo-comments").setup()

-- TODO maybe add trouble.nvim
