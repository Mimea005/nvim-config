---@type LazySpec[]
return {
	{
		'neovim/nvim-lspconfig',
		event = "VeryLazy",
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			require("mason").setup()
			require("mason-lspconfig").setup()

			require("mason-lspconfig").setup {
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					local config = opts[server_name] or {}
					config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
					lspconfig[server_name].setup { config }
				end,

			}
		end,
		keys = {
			{ '<leader>lr', function() vim.lsp.buf.rename() end,          desc = "[r]ename" },
			{ '<leader>la', function() vim.lsp.buf.code_action() end,     desc = "[a]ction" },
			{ '<leader>lf', function() vim.lsp.buf.format() end,          desc = "[f]ormat" },
			{ '<leader>ld', function() vim.lsp.buf.definition() end,      desc = "[d]efinition" },
			{ '<leader>lD', function() vim.lsp.buf.declaration() end,     desc = "[d]eclaration" },
			{ '<leader>lt', function() vim.lsp.buf.type_definition() end, desc = "[t]ype" },
			{ '<leader>li', function() vim.lsp.buf.implementation() end,  desc = "[i]mplementation" },
			{ '<leader>lc', function() vim.lsp.buf.incoming_calls() end,  desc = "[c]alled from" },
			{ '<leader>lC', function() vim.lsp.buf.outgoing_calls() end,  desc = "[C]alls" },
		},
		dependencies = {
			'saghen/blink.cmp',
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			{
				'williamboman/mason-lspconfig.nvim',
				dependencies = {
					{ 'williamboman/mason.nvim' },
				}
			},
			{
				"bombsimon/garmin-monkeyc.nvim",
				ft = "monkeyc",
				config = function()
					require("garmin-monkeyc").setup({
						capabilities = require("blink.cmp").get_lsp_capabilities(),
						developer_key = "~/.Garmin/developer_key"
					})
				end
			}
		},
	},
	{
		"pcolladosoto/tinygo.nvim",
		opts = {}
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>tw",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (workspace)",
			},
			{
				"<leader>tb",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>tl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>tL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>tQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
