vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.wrap = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.opt.arabicshape = false

vim.opt.jumpoptions = "clean,stack,view"

vim.filetype.add({
    extension = {
		gdshaderinc = "gdshaderinc",
    }
})

vim.lsp.config('*', {
	on_attach = function(client, bufnr)
		vim.keymap.set('n', 'grc', vim.lsp.buf.declaration)
		vim.keymap.set('n', '<leader>hb', function()
			vim.lsp.buf.typehierarchy("subtypes")
		end)
		vim.keymap.set('n', '<leader>hp', function()
			vim.lsp.buf.typehierarchy("supertypes")
		end)

		vim.lsp.inlay_hint.enable()
		vim.lsp.codelens.enable()
		vim.lsp.completion.enable(true, client.id, bufnr)
		vim.cmd[[set completeopt=menuone,nosort,noselect,popup,fuzzy]]

		vim.api.nvim_create_autocmd('TextChangedI', {
			callback = function()
				vim.lsp.completion.get()
			end
		})
        if client:supports_method('textDocument/documentHighlight') then
			vim.api.nvim_create_autocmd('CursorMoved', {
				callback = function()
					vim.lsp.buf.clear_references()
					vim.lsp.buf.document_highlight()
				end,
			})
		end
	end,
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('pyrefly')
vim.lsp.enable('gdscript')
vim.lsp.enable('superhtml')

vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
	'https://github.com/nvim-telescope/telescope.nvim',
})

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
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ft', builtin.search_history, { desc = 'Telescope help tags' })



vim.pack.add({'https://github.com/ray-x/aurora'})
vim.g.aurora_italic = 1
vim.g.aurora_transparent = 1
vim.g.aurora_bold = 1
vim.cmd.colorscheme "aurora"

-- vim.pack.add({'https://github.com/water-sucks/darkrose.nvim'})
-- vim.cmd.colorscheme("darkrose")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.pack.add({'https://github.com/linrongbin16/gitlinker.nvim'})
require('gitlinker').setup()
vim.keymap.set('n', '<leader>gy', '<cmd>GitLink<cr>', {})

vim.pack.add({'https://github.com/sindrets/diffview.nvim'})
require("diffview").setup({
	view = {
		merge_tool = {
			layout = "diff4_mixed",
		},
	},
})
vim.keymap.set('n', '<leader>d', ':DiffviewOpen<cr>')
vim.keymap.set('n', '<leader>h', ':DiffviewFileHistory %<cr>')

vim.pack.add({'https://github.com/tpope/vim-fugitive'})
vim.keymap.set('n', '<leader>b', ':G blame<cr>')

vim.pack.add({'https://github.com/windwp/nvim-autopairs'})
require("nvim-autopairs").setup {}

vim.pack.add({'https://github.com/chrisgrieser/nvim-spider'})
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>")
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>")
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>")
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>")
