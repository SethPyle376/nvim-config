local dap, dapui = require("dap"), require("dapui")
dapui.setup({})
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set("n", "<F5>", function()
  dap.continue()
end, { desc = "DAP Continue" })

vim.keymap.set("n", "<F10>", function()
  dap.step_over()
end, { desc = "DAP Step Over" })

vim.keymap.set("n", "<F11>", function()
  dap.step_into()
end, { desc = "DAP Step Into" })

vim.keymap.set("n", "<F12>", function()
  dap.step_out()
end, { desc = "DAP Step Out" })

vim.keymap.set("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, { desc = "DAP Toggle Breakpoint" })

vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP Conditional Breakpoint" })

vim.keymap.set("n", "<leader>dr", function()
  dap.repl.open()
end, { desc = "DAP Open REPL" })

vim.keymap.set("n", "<leader>dl", function()
  dap.run_last()
end, { desc = "DAP Run Last" })

vim.keymap.set("n", "<leader>du", function()
  dapui.toggle()
end, { desc = "DAP Toggle UI" })

vim.keymap.set({ "n", "v" }, "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "DAP Hover" })
