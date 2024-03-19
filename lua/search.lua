local map = vim.api.nvim_set_keymap
-- move 
require('leap').create_default_mappings({
    special_keys = {
  		next_target = '<enter>',
		prev_target = '<tab>',
		next_group = '<space>',
	 	prev_group = '<tab>',
    }
})
vim.keymap.set({'n', 'x', 'o'}, 'cf', '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'cb', '<Plug>(leap-backward)')
