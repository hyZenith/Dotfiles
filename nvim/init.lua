Map = vim.keymap.set
Cmd = vim.cmd
VSCodeNotify = vim.fn.VSCodeNotify
VSCodeCall = vim.fn.VSCodeCall


require('options')
require('functions')

if vim.g.vscode then
	require('vscode/functions')
	require('vscode/mappings')
else
	require('nvim')
end

require('remaps')
require('registers/registers')
require('registers/text-objects')
require('registers/brackets')
-- require('features')
require('big/functions')
require('big/mappings')
require('plugins/plugins')
require('plugins/configuration')
require('plugins/keymaps')





print("nvm laoded")