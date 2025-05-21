-- Basic stuff
vim.g.mapleader = " "
vim.cmd('source ~/.config/nvim/vimrc')
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.directory = "."

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
    { "ray-x/lsp_signature.nvim"},
    { "jbyuki/nabla.nvim"},
    { "nacro90/numb.nvim"},
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {
  "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
  lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
  dependencies = {
    -- main one
    { "ms-jpq/coq_nvim", branch = "coq" },

    -- 9000+ Snippets
    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
    -- - shell repl
    -- - nvim lua api
    -- - scientific calculator
    -- - comment banner
    -- - etc
  },
  init = function()
    vim.g.coq_settings = {
        auto_start = true, -- if you want to start COQ at startup
        -- Your COQ settings here
    }
  end,
  config = function()
    -- Your LSP settings here
  end,
}
})
-- To add down the line:
-- vimtex
-- ALE
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

vim.keymap.set('n', '<Leader>p', require("nabla").popup)
require("numb").setup()

-- Colors
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
