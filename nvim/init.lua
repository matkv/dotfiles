require('plugins')
require('treesitter-config')
require('lualine-config')
require('nvimtree-config')
require('nvim-web-devicons-config')

vim.wo.number = true   		--display line numbers
vim.o.mouse = "a" 		--enable mouse in all modes
vim.wo.cursorline = true	--highlight cursor line

vim.cmd('colorscheme gruvbox')	--set colorscheme to gruvbox

--vim.cmd('NvimTreeOpen')		--auto open filetree
--vim.cmd('vsplit')		--auto split window
