local ok, sidekick = pcall(require, "sidekick")
if not ok then
	return
end

sidekick.setup({
	nes = {
		enabled = false,
	},
	cli = {
		watch = true,
		tools = {
			codex = {
				cmd = { "codex" },
			},
		},
	},
})

vim.keymap.set("n", "<leader>aa", function()
	require("sidekick.cli").toggle()
end, { desc = "Sidekick: Toggle CLI" })

vim.keymap.set("n", "<leader>as", function()
	require("sidekick.cli").select()
end, { desc = "Sidekick: Select CLI" })

vim.keymap.set("n", "<leader>ap", function()
	require("sidekick.cli").prompt()
end, { desc = "Sidekick: Prompt" })

vim.keymap.set("n", "<leader>ac", function()
	require("sidekick.cli").show({ name = "codex", focus = true })
end, { desc = "Sidekick: Codex" })
