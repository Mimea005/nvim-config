require("which-key").add( {
	-- Windows
	{'<C-h>', '<C-w>h', desc = '[h] window left', mode = { 'n', 'v', 'i', 'x' } },
	{'<C-l>', '<C-w>l', desc = '[l] window right', mode = { 'n', 'v', 'i', 'x' } },
	{'<C-k>', '<C-w>k', desc = '[k] window up', mode = { 'n', 'v', 'i', 'x' } },
	{'<C-j>', '<C-w>j', desc = '[j] window down', mode = { 'n', 'v', 'i', 'x' } },
	{'<C-q>', '<C-w>q', desc = '[q] window close', mode = { 'n', 'v', 'i', 'x' } },

	-- Buffer control
	{'<m-k>', function() vim.cmd.bprevious() end, desc = '[h] previous buffer', mode = { 'n', 'v', 'x' } },
	{'<m-j>', function() vim.cmd.bnext() end, desc = '[l] next buffer', mode = { 'n', 'v', 'x' } },

	-- Tabs
	{'<m-h>', function() vim.cmd.tabprevious() end, desc = '[h] previous tab', mode = { 'n', 'v', 'i', 'x' } },
	{'<m-l>', function() vim.cmd.tabnext() end, desc = '[l] next tab', mode = { 'n', 'v', 'i', 'x' } },
	{'<m-q>',
		function()
			local tabs = vim.fn.len(vim.api.nvim_list_tabpages())
			if tabs > 1 then
				vim.cmd.tabclose()
			end
		end,
		desc = '[q] close tab',
		mode = { 'n', 'v', 'i', 'x' }
	},
	{'<m-n>',  function() vim.cmd.tabnew() end, desc = '[n]ew tab', mode = { 'n', 'v', 'i', 'x' } },
	{'<c-t>l', function() vim.cmd.tabnext() end, desc ='[l] next tab', mode = { 'n', 'v', 'i', 'x' } },
	{'<c-t>h', function() vim.cmd.tabprevious() end, desc ='[h] previous tab', mode = { 'n', 'v', 'i', 'x' } },
	{'<c-t>n', function() vim.cmd.tabnew() end, desc ='[n]ew tab', mode = { 'n', 'v', 'i', 'x' } },
	{'<c-t>q', function() vim.cmd.tabclose() end, desc ='[q]uit tab', mode = { 'n', 'v', 'i', 'x' } },

	-- Remap for dealing with word wrap
	-- BUG: These do not work
	{'k', "v:count == 0 ? 'gk' : 'k'", expr = true, mode = { 'n' }, silent = true },
	{'j', "v:count == 0 ? 'gj' : 'j'", expr = true, mode = { 'n' }, silent = true },

	{'<c-s>', function() vim.cmd.write() end, desc = '[s]ave', mode = { 'n', 'v', 'i', 'x' } },

	{'<m-c>', '<c-\\><c-n>', desc = '[e]xit terminal mode', mode = { 't' } },
})
