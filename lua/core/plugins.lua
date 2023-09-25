--init plugins
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

--local truecolor = vim.fn.system("tput initc &>/dev/null && printf yes || printf no") == "yes"

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- My plugins here
	--[[
	use({
		'projekt0n/github-nvim-theme',
		config = function()
			--vim.cmd('colorscheme github_dark_dimmed')
		end
	})
	]]
	use 'rktjmp/lush.nvim'
	--theme collection
	use "GabeeCoding/roblox.nvim"
	use "GabeeCoding/monochrome.nvim"
	use "GabeeCoding/notepad.nvim"
	use "GabeeCoding/red.nvim"
	use "muchzill4/doubletrouble"
	use "Shatur/neovim-ayu"
	use 'barrientosvctor/abyss.nvim'
	use "doums/darcula"

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'}, -- Required
			{'williamboman/mason.nvim'}, -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional
			-- Autocompletion
			{'hrsh7th/nvim-cmp'}, -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'}, -- Required
		}
	}

	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		}
	}

	--[[
	if truecolor then
		vim.cmd("colorscheme nightfox")
		vim.cmd("colorscheme roblox")
	end
	]]
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
