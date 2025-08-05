return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	}

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	use 'mbbill/undotree'

	use 'sainnhe/gruvbox-material'

	use 'fatih/vim-go'

	use 'tpope/vim-surround'

	use "sindrets/diffview.nvim"

	use "tpope/vim-fugitive"

	use {
		'linrongbin16/gitlinker.nvim',
		config = function()
			require('gitlinker').setup()
		end,
	}
end)
