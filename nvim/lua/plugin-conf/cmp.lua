local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<tab>'] = cmp.mapping.select_next_item(),
        ['<s-tab>'] = cmp.mapping.select_prev_item(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    })
})
