local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-p>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- tutorial https://github.com/ziontee113/luasnip-tutorial 
-- all file https://github.com/honza/vim-snippets
