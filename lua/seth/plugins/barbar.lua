vim.g.barbar_auto_setup = false

require'barbar'.setup {
    animation = true,
    auto_hide = true,
    tabpages = true,
    clickable = true,
    focus_on_close = 'left',
    sidebar_filetypes = {
        NvimTree = true
    }
}
