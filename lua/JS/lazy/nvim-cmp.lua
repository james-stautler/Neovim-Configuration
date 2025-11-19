-- Minimal example configuration for lazy.nvim
-- i
return {
    'hrsh7th/nvim-cmp',

    dependencies = {
        'hrsh7th/cmp-nvim-lsp', -- LSP source
        'L3MON4D3/LuaSnip',     -- Snippet engine
        'saadparwaiz1/cmp_luasnip', -- Snippet source
    },

    config = function()
        local cmp = require('cmp')
        cmp.setup({

            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept with Enter
            }),

            sources = cmp.config.sources({
                { name = 'nvim_lsp' }, -- The LSP source
                { name = 'luasnip' },  -- The snippet source
            }),
        })
    end,
}
