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
Plug('Shatur/neovim-ayu')
Plug('Mofiqul/vscode.nvim')

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
Plug('williamboman/mason-lspconfig.nvim')

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

-- Install Mason.nvim
Plug('williamboman/mason.nvim')

-- Install linting
Plug('mfussenegger/nvim-lint')

-- Install autocomplete
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')

vim.call('plug#end')

-- call custom config files for plugins
require("mason").setup()
require("mason-lspconfig").setup {
     ensure_installed = {
          "lua_ls",
          "quick_lint_js",
          "marksman",
          "cssls",
          "clangd",
          "bashls",
          "html"
     },
}

-- Require LSP for syntax highlighting
require('lspconfig').quick_lint_js.setup{}
require('lspconfig').lua_ls.setup{}
require('lspconfig').marksman.setup{}
require('lspconfig').cssls.setup{}
require('lspconfig').clangd.setup{}
require('lspconfig').bashls.setup{}
require('lspconfig').html.setup{}

-- Linting
require('lint')

-- Configure autocomplete
local cmp = require('cmp')
cmp.setup({
     snippet = {
          expand = function(args)
               vim.snippet.expand(args.body)
          end,
     },
     window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
     },
     mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
     }),
     sources = cmp.config.sources({
          { name = 'nvim_lsp' },
     }, {
          { name = 'buffer' },
     })
})

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
--vim.cmd[[colorscheme ayu-dark]]
vim.cmd[[colorscheme vscode]]

-- Configure lualine
vim.opt.showmode = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('lualine').setup({
     options = {
          theme = 'vscode',
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
vim.opt.signcolumn = "yes:2"
require('gitsigns').setup {
     signs = {
          add            = { text = '+' },
          change         = { text = '~' },
          delete         = { text = '-' },
          topdelete      = { text = '-' },
          changedelete   = { text = '-' },
          untracked      = { text = '!' },
     },
     signs_staged = {
          add            = { text = '|' },
          change         = { text = '|' },
          delete         = { text = '|' },
          topdelete      = { text = '-' },
          changedelete   = { text = '-' },
          untracked      = { text = '!' },
     }

}
-- Override colorscheme gitsigns text colors
vim.cmd[[highlight GitSignsAdd guifg=lightgreen]]
vim.cmd[[highlight GitSignsChange guifg=cyan]]
vim.cmd[[highlight GitSignsDelete guifg=red]]
vim.cmd[[highlight GitSignsTopDelete guifg=red]]
vim.cmd[[highlight GitSignsChangeDelete guifg=red]]
vim.cmd[[highlight GitSignsUntracked guifg=gold]]

-- incorporate system clipboard with neovim
-- Install xclip for X11 window manager. To use, enter "+y to copy and "+p to paste from xclip clipboard
vim.opt.clipboard = "unnamedplus"

-- Open Nvim Tree when starting Neovim
vim.cmd("NvimTreeOpen")
