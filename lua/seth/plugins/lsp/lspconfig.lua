local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
  keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Rust
vim.lsp.config("rust_analyzer", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {},
  },
})
vim.lsp.enable("rust_analyzer")

-- Python
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.enable("pyright")

-- C# (omnisharp)
vim.lsp.config("omnisharp", {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.enable("omnisharp")

-- C/C++ (clangd)
vim.lsp.config("clangd", {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.enable("clangd")

vim.lsp.config("jdtls", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    java = {
      signatureHelp = { enabled = true }
    },
  },
})
vim.lsp.enable("jdtls")

require('lsp_signature').setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  },
  floating_window = true,
})
