local Plug = vim.fn['plug#']

-- Vim-Plug package manager
vim.call('plug#begin')

-- Telescope
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make'})
Plug('nvim-telescope/telescope.nvim')

-- ColorSchemes
Plug('folke/tokyonight.nvim')
Plug('catppuccin/nvim', { ['as'] = 'catpuccin' })
Plug('NLKNguyen/papercolor-theme')
Plug('0xstepit/flow.nvim')
Plug('Shatur/neovim-ayu')

-- Lualine
Plug('nvim-lualine/lualine.nvim')

-- Add Nvim-tree and Nvim-web-devicons to add file tree view from neovim
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')

-- Vim Fugitive
Plug('tpope/vim-fugitive')

-- GitSigns (show git signs in buffer)
Plug('lewis6991/gitsigns.nvim')

-- LSP
Plug('neovim/nvim-lspconfig')

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

-- Install Mason.nvim
Plug('williamboman/mason.nvim')

vim.call('plug#end')

-- call custom config files for plugins
require("mason").setup()

-- Configure Nvim-Tree
require('nvim-tree').setup ({
     view = {
          width = 50,
     },
})

-- Configure telescope
local telescope = require('telescope')
telescope.setup {}
telescope.load_extension('fzf')

-- Require LSP for syntax highlighting
--require'lspconfig'.quick_lint_js.setup{}

-- syntax highlighting
--vim.opt.syntax = 'on'
require'nvim-treesitter.configs'.setup {
     ensure_installed = { "javascript","lua","vim","markdown","markdown_inline","html","css","go","svelte" },
     sync_install = false,
     auto_install = true,
     highlight = {
          enable = true
     }
}

-- enable 24-bit color
vim.opt.termguicolors = true

--vim.cmd[[colorscheme tokyonight-night]]
--vim.cmd[[colorscheme catppuccin-mocha]]
--require("catppuccin").setup()
--vim.cmd[[colorscheme PaperColor]]
--vim.cmd[[colorscheme flow]]
vim.cmd[[colorscheme ayu-dark]]

-- Configure lualine
vim.opt.showmode = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('lualine').setup({
     options = {
          theme = 'ayu',
     },
     active = {
          left = {
               {'mode', 'past' },
               {'gitbranch', 'filename','modified' }
          }
     },
     component_function = {
          gitbranch = 'fugitive#head'
     }
})

-- set tab space width
vim.opt.tabstop = 5
vim.opt.softtabstop = 5
vim.opt.expandtab = true

-- autoindents
vim.opt.smartindent = true
vim.opt.shiftwidth = 5

vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.relativenumber = true

-- Add fixed width column for showing git line status information
vim.opt.signcolumn = "yes:1"
require('gitsigns').setup {
     signs = {
          add            = { text = '+' },
          change         = { text = '~' },
          delete         = { text = '-' },
          topdelete      = { text = '`' },
          changedelete   = { text = '_' },
          untracked      = { text = '!' },
     }
}

-- incorporate system clipboard with neovim
-- Install xclip. To use, enter "+y to copy and "+p to paste from xclip clipboard
vim.opt.clipboard = "unnamedplus"

-- Open Nvim Tree when starting Neovim
vim.cmd("NvimTreeOpen")
