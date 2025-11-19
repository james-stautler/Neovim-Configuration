
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr } 

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
end

return {
    {
        "neovim/nvim-lspconfig", 
        
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },

        event = { "BufReadPost", "BufNewFile" },

        config = function()

            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", "pyright", "ts_ls", "clangd", "html", "cssls",
                    "jsonls", "yamlls", "marksman", "gopls", "rust_analyzer",
                    "csharp_ls", "bashls"
                },

                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({
                            on_attach = on_attach
                        })
                    end,

                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            on_attach = on_attach,
                            settings = {
                                Lua = {
                                    workspace = {
                                        checkThirdParty = false,
                                        library = { vim.env.VIMRUNTIME }
                                    },
                                    telemetry = { enable = false}
                                },
                            },
                        })
                    end,
                }
            })
        end,
    }
}
