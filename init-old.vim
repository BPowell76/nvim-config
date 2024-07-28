" Vim-Plug package manager
call plug#begin()

" One Dark color scheme
Plug 'navarasu/onedark.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
Plug 'nvim-telescope/telescope.nvim'

" Lualine
Plug 'nvim-lualine/lualine.nvim'

" Add Nvim-tree and Nvim-web-devicons to add file tree view from neovim
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Vim Fugitive
Plug 'tpope/vim-fugitive'

" GitSigns (show git signs in buffer)
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

" call custom config files for plugins
lua require('user')

" syntax highlighting
syntax on

" enable 24-bit color
set termguicolors

" configure Vim One colorscheme
" colorscheme one
colorscheme onedark

" Disable status line since lightline is installed
set noshowmode

" set tab space width
set tabstop=5
set softtabstop=5
set expandtab

" autoindents
set smartindent
set shiftwidth=5

set number
set numberwidth=5
set relativenumber

set signcolumn=yes:2 " add column for showing signs for git information, etc.

" incorporate system clipboard with neovim
" set clipboard+=unnamed

NvimTreeOpen
