local setup, nvimtree = pcall(require, "nvim-tree")

if not setup then
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1


nvimtree.setup({
  view = {
    adaptive_size = true
  },
  update_focused_file = {
    enable = true,        -- keeps the cursor in view
    update_cwd = true,
  },
  renderer = {
    group_empty = true
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      }
    }
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500
  }
})
