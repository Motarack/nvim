require("plugins")
require("set")

vim.lsp.config('*', {
	on_attach = function(client, bufnr)
		vim.lsp.inlay_hint.enable()

		vim.cmd[[set completeopt+=menuone,noselect,popup,fuzzy]]
		local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
        client.server_capabilities.completionProvider.triggerCharacters = chars
		vim.lsp.completion.enable(true, client.id, bufnr, {
			autotrigger = true,
		})
	end
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('pyrefly')
vim.lsp.enable('gdscript')

