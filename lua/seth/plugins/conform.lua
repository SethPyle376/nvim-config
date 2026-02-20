require('conform').setup{
    formatters_by_ft = {
        java = { 'google_java_format' },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },
}
