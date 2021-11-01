return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- Gruvbox color scheme
    use 'morhetz/gruvbox'

    -- Treesitter syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    --- Icons used by lualine
    use 'kyazdani42/nvim-web-devicons'

    --- Lualine statusline
    use {
	'nvim-lualine/lualine.nvim',
	requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    --- Nvim tree file explorer
    use {
    	'kyazdani42/nvim-tree.lua',
    	requires = 'kyazdani42/nvim-web-devicons',
    	config = function() require'nvim-tree'.setup {} end
    }

    --- Barbar tabline
    use {
  	'romgrk/barbar.nvim',
  	requires = {'kyazdani42/nvim-web-devicons'}
    }
end)
