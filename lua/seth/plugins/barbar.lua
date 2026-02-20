vim.g.barbar_auto_setup = false

require'barbar'.setup {
    animation = true,
    auto_hide = false,
    tabpages = true,
    clickable = true,
    focus_on_close = 'left',
    highlight_visible = true,
    sidebar_filetypes = {
        NvimTree = true
    },
    icons = {
      buffer_index = true,
      button = 'x'
    }
}

require 'barbar.highlight'.setup()
