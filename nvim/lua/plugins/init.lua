return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- Nord color scheme
    use 'shaunsingh/nord.nvim'

    -- Treesitter syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }	
end)
