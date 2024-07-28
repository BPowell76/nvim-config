-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- require('user/lightline')
require('lualine').setup()
require('user/telescope')

-- require('nvim-tree').setup()
require('nvim-tree').setup({
     view = {
          width = 50,
     },
})
