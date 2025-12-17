return {
  cmd = {
	  'pyrefly',
	  'lsp',
  },
  filetypes = { 'python' },
  root_markers = {
    'pyrefly.toml',
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },
  init_options = {
	pythonPath = '/home/motarack/python-venv/bin/python3.13',
	pyrefly = {
	  displayTypeErrors = 'force-on',
	},
  },
  on_exit = function(code, _, _)
    vim.notify('Closing Pyrefly LSP exited with code: ' .. code, vim.log.levels.INFO)
  end,
}
