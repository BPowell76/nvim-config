## Purpose ##

Put this together for my own use to use across machines at different locations. Sharing for anyone that wants to use it.

## Neovim Installation Script ##

The shell script `build-install-neovim.sh` allows for an automated installation process of various Neovim releases.
You specify the release version of Neovim as found on the [repo's releases page](https://github.com/neovim/neovim/releases) to install and it builds from source the package.
The script does not, however, verify the SHA256 Checksum of the tar file.

## Plugins ##

### Manager ###

The primary plugin manager used is [vim-plug](https://github.com/junegunn/vim-plug).

### Neovim Modifiers ###

- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Nvim Tree](https://github.com/nvim-tree/nvim-tree.lua)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Vim Fugitive](https://github.com/tpope/vim-fugitive)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

### LSP/Linting/Formatting ###

- [mason](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)

## Known Issues ##

`telescope.load_extension('fzf')` seems to cause some issues when installed on a fresh environment (tested on WSL).
