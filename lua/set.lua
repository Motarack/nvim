vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.filetype.add({ extension = { templ = "templ" } })

vim.opt.arabicshape = false

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*.go",
--	command = "%!goimports"
-- })

vim.keymap.set('n', '<leader>s', ':set invspell<cr>')

