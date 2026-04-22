require('telescope').setup({
	defaults={
		file_ignore_patterns={
			"%.gd.uid",
			"%.gdshader.uid",
			"%.gdshaderinc.uid",
		},
	},
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

