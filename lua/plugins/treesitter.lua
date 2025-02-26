return {
	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			'RRethy/nvim-treesitter-endwise',
			'windwp/nvim-ts-autotag',
			'JoosepAlviste/nvim-ts-context-commentstring',
		},
		build = ':TSUpdate',
		config = function(_, opts)
			require 'nvim-treesitter.install'.compilers = { "clang" }
			local config = require("nvim-treesitter.configs")
			config.setup(opts)
			require("ts_context_commentstring").setup(opts.context_commentstring or {})
			vim.g.skip_ts_context_commentstring_module = true
			vim.opt.foldmethod = 'expr'
			vim.opt.foldexpr = 'nvim_treesittrer#foldexpr()'
			vim.opt.foldenable = false
		end,
		opts = {
			-- Add languages to be installed here that you want installed for treesitter
			ensure_installed = {
				'c',
				'cpp',
				'go',
				'lua',
				'python',
				'rust',
				'tsx',
				'javascript',
				'typescript',
				'vimdoc',
				'vim',
				'astro'
			},

			-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
			auto_install = true,

			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<c-space>',
					node_incremental = '<c-space>',
					scope_incremental = '<c-s>',
					node_decremental = '<M-space>',
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						['aa'] = '@parameter.outer',
						['ia'] = '@parameter.inner',
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						['gm'] = '@function.outer',
						['gs'] = '@class.outer',
					},
					goto_next_end = {
						['gme'] = '@function.outer',
						['gse'] = '@class.outer',
					},
					goto_previous_start = {
						['gM'] = '@function.outer',
						['gS'] = '@class.outer',
					},
					goto_previous_end = {
						['gMe'] = '@function.outer',
						['gSe'] = '@class.outer',
					},
				},
				swap = {
					enable = false,
					-- TODO: Decide on keymap
					swap_next = {
						['<leader>a'] = '@parameter.inner',
					},
					swap_previous = {
						['<leader>A'] = '@parameter.inner',
					},
				},
			},
			endwise = {
				enable = true
			},
			autotag = {
				enable = true
			}
		}
	},
}
