require('plugins')
require('treesitter-config')
require('lualine-config')

vim.wo.number = true   		--display line numbers
vim.o.mouse = "a" 		--enable mouse in all modes
vim.wo.cursorline = true	--highlight cursor line

vim.cmd('colorscheme gruvbox')	--set colorscheme to nord
