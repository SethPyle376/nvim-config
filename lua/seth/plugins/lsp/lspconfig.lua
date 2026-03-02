local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Core LSP navigation
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  keymap.set("n", "gr", vim.lsp.buf.references, opts)
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

  -- Telescope-powered symbol navigation
  keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts)
  keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts)
  keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)
  keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
  keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts)
  keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<CR>", opts)

  -- LSP actions/diagnostics
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymap.set("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  keymap.set("n", "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
  keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
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
  cmd = {
    "clangd",
    "--background-index",
    "--header-insertion=never",
    "--completion-style=detailed",
    "--clang-tidy=false",
  },
})
vim.lsp.enable("clangd")

vim.lsp.config("jdtls", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    java = {
      signatureHelp = { enabled = true },
    },
  },
})
vim.lsp.enable("jdtls")

require("lsp_signature").setup({
  bind = true,
  handler_opts = {
    border = "rounded",
  },
  floating_window = true,
})
