return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
	},
	{
		"Zeioth/hot-reload.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "BufEnter",
		opts = function()
			local config_dir = vim.fn.stdpath("config") .. "/lua/"
			return {
				-- Files to be hot-reloaded when modified.
				reload_files = {
					config_dir .. "keymaps/base.lua",
				},
			}
		end
	},
}
