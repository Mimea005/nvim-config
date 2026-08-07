return {
	-- Easy navigation
	{
		'ggandor/leap.nvim',
		config = function() require('leap').add_default_mappings(true) end,
		dependencies = {
			'tpope/vim-repeat',
			{
				'folke/flash.nvim',
				event = 'VeryLazy',
				opts = {
					modes = {
						char = {
							jump_labels = true,
							multi_line = false,
						},
					}
				},
				keys = {
					{ 'r', mode = { 'o' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
				}
			},
		},
	},
	{
		'stevearc/oil.nvim',
		lazy = false,
		opts = {
			default_file_explorer = true,
			delete_on_trash = false,
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = true,
			columns = {
				'icons',
				'permissions'
			},
			view_options = {
				show_hidden = true
			},
			buf_options = {
				buflisted = false,
				bufhidden = 'hide',
			},
			win_options = {
				wrap = false,
				signcolumn = 'no',
				cursorcolumn = false,
				foldcolumn = '0',
				spell = false,
				list = false,
				conceallevel = 3,
				concealcursor = 'nvic',
			},
		},
		keys = {
			{ '<leader>oc', function() require('oil').open() end,                      desc = '[c]urrent dir' },
			{ '<leader>ow', function() require('oil').open(vim.fn.getcwd(-1, -1)) end, desc = '[w]orkspace dir' },
		},
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		}
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		cmd = 'Telescope',
		config = function(_, opts)
			local telescope = require('telescope')
			telescope.setup(opts)
			telescope.load_extension('fzf')
		end,
		opts = {
			defaults = {
				git_worktrees = vim.g.git_worktrees,
				path_display = { 'truncate' },
				sorting_strategy = 'ascending',
				layout_config = {
					horizontal = { prompt_position = 'top', preview_width = 0.55 },
					vertical = { mirror = false },
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				mappings = {
					i = {
						['<C-h>'] = 'which_key',
						['<C-j>'] = 'move_selection_next',
						['<C-k>'] = 'move_selection_previous',
					},
					n = { q = 'close' },
				},
			},
			pickers = {
				buffers = {
					mappings = {
						n = {
							["<C-b>"] = "delete_buffer"
						},
						i = {
							["<C-b>"] = "delete_buffer"
						}
					}
				}
			}
		},
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				enabled = vim.fn.executable 'make' == 1,
				build = 'make',
				config = function(_, opts)
					require('telescope').setup {
						extensions = {
							fzf = opts
						}
					}
				end
			},
			{
				'folke/todo-comments.nvim',
				dependencies = {
					'nvim-lua/plenary.nvim',
					'folke/trouble.nvim',
				},
				lazy = false,
				opts = {
					signs = true,
					-- list of named colors where we try to extract the guifg from the
					-- list of highlight groups or use the hex color if hl not found as a fallback
					colors = {
						error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
						warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
						info = { 'DiagnosticInfo', '#75c3EB' },
						hint = { 'DiagnosticHint', '#10a981' },
						default = { 'Identifier', '#c5c5c5' },
						test = { 'Identifier', '#fee050' },
						-- Custom
						perf = { '#ffb030' },
						success = { '#40ee40' },
						current = { '#347D39' },
						closed = { '#347D39' },
					},
					keywords = {
						REF = {
							icon = '',
							color = 'default',
							alt = {
								'GH',
								'GITHUB',
								'SO',
								'STACKOVERFLOW'
							}
						},
						ISSUE = {
							icon = '',
							color = 'current',
							alt = {
								'OPENISSUE',
								'ISSUEOPEN'
							}
						},
						PR = {
							icon = '',
							color = 'current'
						},
						-- ------------------------------------
						FIX = {
							icon = ' ', -- icon used for the sign, and in search results
							color = 'error', -- can be a hex color, or a named color (see below)
							alt = {
								'FIXME',
								'BUG',
								'FIXIT',
							},
							-- a set of other keywords that all map to this FIX keywords
							-- signs = false, -- configure signs for some keywords individually
						},
						TODO = {
							icon = ' ',
							color = 'info'
						},
						HACK = {
							icon = '',
							color = 'warning',
							alt = {
								'SHAKY',
							}
						},
						WHAT = {
							icon = '',
							alt = {
								'UNSURE',
								'QUESTION',
								'Q'
							}
						},
						WARN = {
							icon = ' ',
							color = 'warning',
							alt = {
								'WARNING',
							}
						},

						PERF = {
							icon = '',
							color = 'perf',
							alt = {
								'PERFORMANCE',
								'OPTIMIZE'
							}
						},

						NOTE = {
							icon = '󰎚',
							color = 'hint',
							alt = { 'INFO' }
						},

						TEST = {
							icon = '',
							color = 'test',
							alt = {
								'TESTING',
								'PASSED',
								'FAILED'
							}
						},
						DOC = {
							icon = '󰧮',
							color = 'default',
							alt = {
								'DOCUMENTATION',
								'EXPLAIN',
								'EXPLANATION'
							}
						}
					},
				},
				keys = {
					{ '<leader>ft', '<cmd>TodoTelescope<cr>', desc = '[t]odo', },
				}
			},
			{
				"folke/which-key.nvim",
			}
		},
		keys = {
			{ '<leader>f',  function() require('telescope.builtin').marks() end,                               desc = '[m]arks' },
			{ '<leader>gb', function() require('telescope.builtin').git_branches { use_file_path = true } end, desc = 'Git branches' },
			{ '<leader>gc', function() require('telescope.builtin').git_commits { use_file_path = true } end,  desc = 'Git commits (repository)' },
			{
				'<leader>gC',
				function() require('telescope.builtin').git_bcommits { use_file_path = true } end,
				desc = 'Git commits (current file)'
			},
			--	{ '<leader>gt',       function() require('telescope.builtin').git_status { use_file_path = true } end,            desc = 'Git status' },
			{ '<leader>f<CR>',    function() require('telescope.builtin').resume() end,                                       desc = 'Resume previous search' },
			{ '<leader>f/',       function() require('telescope.builtin').current_buffer_fuzzy_find() end,                    desc = '[/] words in current buffer' },
			{ '<leader><leader>', function() require('telescope.builtin').current_buffer_fuzzy_find() end,                    desc = 'Find words in current buffer' },
			{ '<leader>fb',       function() require('telescope.builtin').buffers() end,                                      desc = '[b]uffers' },
			{ '<leader>fc',       function() require('telescope.builtin').grep_string() end,                                  desc = 'word under [c]ursor' },
			{ '<leader>fC',       function() require('telescope.builtin').commands() end,                                     desc = '[C]ommands' },
			{ '<leader>ff',       function() require('telescope.builtin').find_files() end,                                   desc = '[f]iles' },
			{ '<leader>fF',       function() require('telescope.builtin').find_files { hidden = true, no_ignore = true } end, desc = 'all [F]iles', },
			{ '<leader>fh',       function() require('telescope.builtin').help_tags() end,                                    desc = '[h]elp' },
			{ '<leader>fk',       function() require('telescope.builtin').keymaps() end,                                      desc = '[k]eymaps' },
			{ '<leader>fm',       function() require('telescope.builtin').man_pages() end,                                    desc = '[m]an' },
			{ '<leader>fa',       function() require('telescope.builtin').builtin({ include_extensions = true }) end,         desc = '[a]ll' },
			-- if is_available 'nvim-notify' then
			--   maps.n['<leader>fn'] =
			--     { function() require('telescope').extensions.notify.notify() end, desc = 'Find notifications' }
			--   maps.n['<leader>uD'] =
			--     { function() require('notify').dismiss { pending = true, silent = true } end, desc = 'Dismiss notifications' }
			-- end
			{ '<leader>fo',       function() require('telescope.builtin').oldfiles() end,                                     desc = 'hist[o]ry' },
			{ '<leader>fr',       function() require('telescope.builtin').registers() end,                                    desc = '[r]egisters' },
			{ '<leader>fw',       function() require('telescope.builtin').live_grep() end,                                    desc = '[w]ords' },
			-- {
			-- 	'<leader>fW',
			-- 	function()
			-- 		require('telescope.builtin').live_grep {
			-- 			additional_args = function(args) return vim.list_extend(args, { '--hidden', '--no-ignore' }) end,
			-- 		}
			-- 	end,
			-- 	desc = 'Find words in all files',
			-- },
			{ '<leader>fd',       function() require('telescope.builtin').diagnostics() end,                                  desc = '[d]iagnostics' },
			{
				'<leader>ls',
				function()
					local aerial_avail, _ = pcall(require, 'aerial')
					if aerial_avail then
						require('telescope').extensions.aerial.aerial()
					else
						require('telescope.builtin').lsp_document_symbols()
					end
				end,
				desc = '[s]ymbols',
			},
		}
	},
}
