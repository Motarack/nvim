require("diffview").setup({
	view = {
		merge_tool = {
			layout = "diff4_mixed",
		},
	},
})
vim.keymap.set('n', '<leader>d', ':DiffviewOpen<cr>')
vim.keymap.set('n', '<leader>h', ':DiffviewFileHistory %<cr>')
