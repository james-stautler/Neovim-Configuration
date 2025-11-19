
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        warnings = {
            enabled = false
        }
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
  },
}
