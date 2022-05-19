local fn = vim.fn

-- █ █▄░█ █▀ ▀█▀ ▄▀█ █░░ █░░   █▀█ ▄▀█ █▀▀ █▄▀ █▀▀ █▀█
-- █ █░▀█ ▄█ ░█░ █▀█ █▄▄ █▄▄   █▀▀ █▀█ █▄▄ █░█ ██▄ █▀▄
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- █▀█ ▄▀█ █▀▀ █▄▀ █▀▀ █▀█   █▀█ █▀█ █▀█ █░█ █▀█
-- █▀▀ █▀█ █▄▄ █░█ ██▄ █▀▄   █▀▀ █▄█ █▀▀ █▄█ █▀▀
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("kyazdani42/nvim-web-devicons") -- Add filetype icons like nerdfonts
	use("norcalli/nvim-base16.lua") -- Enable base64 themes
	-- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("moll/vim-bbye") -- Delete buffers easily
	use("nvim-lualine/lualine.nvim") -- Easy and configurable statusbar
	use("akinsho/toggleterm.nvim") -- Toggle terminal
	use("lukas-reineke/indent-blankline.nvim") -- Indented guidelines
	use("mhinz/vim-startify") -- Better than Alpha
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("Pocco81/AutoSave.nvim") -- A savior
	use("norcalli/nvim-colorizer.lua") -- Colorizes color codes
	use("rcarriga/nvim-notify") -- Notify daemon
	use("max397574/better-escape.nvim") -- Escape from instert mode fast
	use("folke/todo-comments.nvim") -- A beautiful todo comments
	use("xiyaowong/nvim-cursorword") -- Highlight cursor word
	use("simrat39/symbols-outline.nvim") -- A tree like view for symbols
	use("winston0410/cmd-parser.nvim") -- Input some cmds
	use("lewis6991/impatient.nvim") -- Improve nvim startup
	use("kosayoda/nvim-lightbulb") -- Nicer code actions signs
	use("nvim-lua/popup.nvim") -- Some popup tool
	use("weilbith/nvim-code-action-menu") -- Better code action menu
	use("akinsho/bufferline.nvim") -- Beautiful bufferline
 
  -- █░█░█ █░█ █ █▀▀ █░█ █▄▀ █▀▀ █▄█
  -- ▀▄▀▄▀ █▀█ █ █▄▄ █▀█ █░█ ██▄ ░█░
  use({
		"folke/which-key.nvim",
		config = function()
			require("plugins.configs.which-key").setup()
		end,
	})
	use({
		"ellisonleao/glow.nvim",
		branch = "main",
	}) -- Amazing markdown viewer

	-- █▀▀ █▀█ █░░ █▀█ █▀█ █▀ █▀▀ █░█ █▀▀ █▀▄▀█ █▀▀
	-- █▄▄ █▄█ █▄▄ █▄█ █▀▄ ▄█ █▄▄ █▀█ ██▄ █░▀░█ ██▄

	use("EdenEast/nightfox.nvim")

	
	-- █▀█ ▄▀█ █ █▀█ █▀
	-- █▀▀ █▀█ █ █▀▄ ▄█
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.configs.autopairs")
		end,
	})


	-- █▀▀ █▀▄▀█ █▀█   █▀█ █░░ █░█ █▀▀ █ █▄░█ █▀
	-- █▄▄ █░▀░█ █▀▀   █▀▀ █▄▄ █▄█ █▄█ █ █░▀█ ▄█

	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-nvim-lsp-signature-help")


	-- █▀ █▄░█ █ █▀█ █▀█ █▀▀ ▀█▀ █▀
	-- ▄█ █░▀█ █ █▀▀ █▀▀ ██▄ ░█░ ▄█
	
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- █░░ █▀ █▀█
	-- █▄▄ ▄█ █▀▀

	use("williamboman/nvim-lsp-installer")
	use("neovim/nvim-lspconfig") -- enable LSP
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("onsails/lspkind.nvim")

	-- ▀█▀ █▀▀ █░░ █▀▀ █▀ █▀▀ █▀█ █▀█ █▀▀
	--  █░ ██▄ █▄▄ ██▄ ▄█ █▄▄ █▄█ █▀▀ ██▄

	use("nvim-telescope/telescope.nvim")

	use("nvim-telescope/telescope-fzf-native.nvim")

	-- ▀█▀ █▀█ █▀▀ █▀▀ █▀ █ ▀█▀ ▀█▀ █▀▀ █▀█
	-- ░█░ █▀▄ ██▄ ██▄ ▄█ █ ░█░ ░█░ ██▄ █▀▄

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({
		"m-demare/hlargs.nvim",
		config = function()
			require("hlargs").setup()
		end,
	})

	-- █▀▀ █ ▀█▀
	-- █▄█ █ ░█░

	use("lewis6991/gitsigns.nvim")
	use("TimUntersberger/neogit")


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
