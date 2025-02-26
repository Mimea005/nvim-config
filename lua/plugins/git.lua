return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1
			require("telescope").load_extension("lazygit")
			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				callback = function()
					require("lazygit.utils").project_root_dir()
				end
			})
		end,
		keys = {
			{ '<leader>fg', function() require('telescope').extensions.lazygit.lazygit() end, desc = 'lazy[g]it' },
			{ '<leader>gl', function() require('lazygit').lazygit() end,                      desc = 'lazy[g]it' },
		}
	}
}
