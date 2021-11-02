require('plugins')
require('treesitter-config')
require('lualine-config')
require('nvimtree-config')
require('nvim-web-devicons-config')

vim.wo.number = true   		--display line numbers
vim.o.mouse = "a" 		--enable mouse in all modes
vim.wo.cursorline = true	--highlight cursor line
vim.o.splitbelow = false	--disable auto splitting below
vim.o.splitright = true 	--split to the right when using :split command
vim.o.wrap = false

vim.cmd('colorscheme gruvbox')	--set colorscheme to gruvbox

vim.cmd[[au VimEnter * NvimTreeOpen]]
vim.cmd[[au VimEnter * wincmd p]]
vim.cmd[[au VimEnter * terminal]]
vim.cmd[[au VimEnter * wincmd k]]
vim.cmd[[au VimEnter * vsplit new]]
