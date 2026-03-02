local ok, snacks = pcall(require, "snacks")
if not ok then
	return
end

snacks.setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false }, -- keep alpha-nvim dashboard
	explorer = { enabled = false }, -- keep nvim-tree
	indent = { enabled = true },
	input = { enabled = true },
	notifier = { enabled = true },
	picker = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	statuscolumn = { enabled = false },
	words = { enabled = true },
})

if snacks.picker then
	vim.keymap.set("n", "<leader>sf", function()
		snacks.picker.files()
	end, { desc = "Snacks Files" })

	vim.keymap.set("n", "<leader>sg", function()
		snacks.picker.grep()
	end, { desc = "Snacks Grep" })

	vim.keymap.set("n", "<leader>sb", function()
		snacks.picker.buffers()
	end, { desc = "Snacks Buffers" })
end
