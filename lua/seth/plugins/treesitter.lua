local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  highlight = {
    enable = true,
  },
  indent = { enable = true },
  sync_install = false,
  ensure_installed = {
    "c",
    "cpp",
    "sql",
    "rust",
    "python",
    "gitignore",
    "lua",
    "vim",
    "yaml",
    "java",
  },
  auto_install = false,
})
