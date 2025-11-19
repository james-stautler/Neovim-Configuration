
return {

    "pocco81/auto-save.nvim",

    config = function()
        
        require("auto-save").setup({

            enabled = true,
            execution_message = {
                message = function()
                    return ("Autosave: saved at " .. vim.fn.strftime("%H:%M:%S"))
                end,
                dim = 0.18,
                cleaning_interval = 1250,
            },
            trigger_events = {
                "InsertLeave",
                "TextChanged",
            },
            condition = function(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")

                if fn.getbufvar(buf, "&buftype") ~= "" then
                    return false
                end
                
                return true
            
            end,
        })

    end,
}
