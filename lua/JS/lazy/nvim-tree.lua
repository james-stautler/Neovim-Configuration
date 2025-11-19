
return {
    
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    cmd = { 'NvimTreeToggle' },

    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,

    config = function()
        local api = require("nvim-tree.api")

        require("nvim-tree").setup({
            view = {
                width = 30,
            },
            renderer = {
                root_folder_label = false,
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true
                    },
                },
            },
            filters = {
                dotfiles = false
            },
            git = {
                enable = true,
                ignore = false,
            },
        }) 
    end,
}
