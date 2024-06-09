local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})

require('mason-lspconfig').setup({
  handlers = {
    tailwindcss = function()
		require('lspconfig').tailwindcss.setup({
          filetypes = { "templ", "javascript", "typescript" },
          init_options = { userLanguages = { templ = "html" } },
		})
	end,
	html = function()
		require('lspconfig').html.setup({
			filetypes = { "html", "templ" },
		})
	end
  }
})

