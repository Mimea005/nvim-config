return {
	-- Close buffers
	{
		'Asheq/close-buffers.vim',
		keys = {
			{ '<leader>bd',  ':Bdelete this<cr>',     desc = 'delete' },
			{ '<leader>bdo', ':Bdelete other<cr>',    desc = 'other' },
			{ '<leader>bdh', ':Bdelete hidden<cr>',   desc = 'hidden' },
			{ '<leader>bdn', ':Bdelete nameless<cr>', desc = 'nameless' },
			{ '<leader>bda', ':Bdelete all<cr>',      desc = 'all' },
			{ '<leader>bds', ':Bdelete select<cr>',   desc = 'selesct' }
		}
	},
}
