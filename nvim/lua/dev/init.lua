require('dev.local')
require('dev.plugins')

vim.o.termguicolors = true

-- Configuration for plugins go below
require('dev.plugin-conf.bufferline')
require('dev.plugin-conf.cmp')
require('dev.plugin-conf.lualine')
require('dev.plugin-conf.lsp')
require('dev.plugin-conf.nvim-tree')
require('dev.plugin-conf.telescope')
require('dev.plugin-conf.treesitter')

-- Settings should come after plugins, since they may reference them
require('dev.editor')
require('dev.mappings')
require('dev.colourscheme')
