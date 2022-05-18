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
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("moll/vim-bbye") -- Delete buffers easily
	use("nvim-lualine/lualine.nvim") -- Easy and configurable statusbar

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
