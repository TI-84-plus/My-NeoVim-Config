local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end


vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-java/nvim-java"},
	{ "mfussenegger/nvim-jdtls"},

    { "hrsh7th/nvim-cmp"},
    { "hrsh7th/cmp-buffer"},
    { "hrsh7th/cmp-path"},
    { "hrsh7th/cmp-cmdline"},
    { "hrsh7th/cmp-nvim-lsp"},
    { "williamboman/mason.nvim", "williamboman/mason.lspconfig.nvim", "neovim/nvim-lspconfig"},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-treesitter/nvim-treesitter"},

    --{ "nvim-tree/nvim-tree.lua"},
  	--dependencies = {
    		--"nvim-tree/nvim-web-devicons",},

    { "nvim-telescope/telescope.nvim",
    	dependencies = {"nvim-lua/plenary.nvim"}},
	{ "ilyachur/cmake4vim"}
})



