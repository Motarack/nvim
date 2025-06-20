local gdproject = io.open(vim.fn.getcwd()..'/project.godot', 'r')
if gdproject then
	io.close(gdproject)
	vim.fn.serverstart './godothost'
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
require('lspconfig').gdscript.setup(capabilities)
