

return {
	
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"cpp",
				"css",
				"csv",
				"cuda",
				"html",
				"java",
				"javascript",
				"json",
				"kotlin",
				"make",
				"markdown",
				"python",
				"typescript"
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true }
		})
	end

}



