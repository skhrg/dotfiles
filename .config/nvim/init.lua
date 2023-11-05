-- Basic stuff
vim.g.mapleader = " "
vim.cmd('source ~/.config/nvim/vimrc')
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Plugin management
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
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
	{ "lewis6991/gitsigns.nvim", config = true},
	{ "ibhagwan/fzf-lua"},
	{ "nvim-tree/nvim-web-devicons"},
	{ "nvim-tree/nvim-tree.lua"},
    { "numToStr/Comment.nvim"},
    { "beauwilliams/statusline.lua"},
    { "williamboman/mason.nvim"},
    { "neovim/nvim-lspconfig"},
    { "williamboman/mason-lspconfig.nvim"},
    { "ms-jpq/coq_nvim",  branch = "coq",
        init = function() vim.g.coq_settings = { auto_start = true } end,
        lazy = False},
    { "ms-jpq/coq.artifacts"},
    { "ray-x/lsp_signature.nvim"},
})
-- To add down the line:
-- vimtex
-- ALE
-- treesitter
-- auto-pandoc
-- dropbar?
require("fzf-lua").setup()
require("nvim-tree").setup()
require('Comment').setup()
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"pyright", "clangd"}
})
require("lsp_signature").setup()

local coq = require("coq")
require("lspconfig").pyright.setup{coq.lsp_ensure_capabilities()}
require("lspconfig").clangd.setup{coq.lsp_ensure_capabilities()}

-- Colors
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
