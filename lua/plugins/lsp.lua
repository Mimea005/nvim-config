return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{
				'williamboman/mason-lspconfig.nvim',
				dependencies = {
					{ 'williamboman/mason.nvim' },
				}
			},
		},
		config = function(_, opts)
			require("mason").setup()
			require("mason-lspconfig").setup()

			require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
					local config = opts[server_name] or {}
					config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
					require("lspconfig")[server_name].setup {config}
        end,
			}
		end
	},
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
}
