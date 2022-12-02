require('overseer').register_template({
    name = 'Python Format',
    builder = function (params)
        local file = vim.fn.expand("%:p")
        local cmd = { 'yapf', '--recursive', '--parallel', '--verbose', '--in-place', file }
        return {
            cmd = cmd,
            components = {
                { "on_output_quickfix", set_diagnostics = true },
                "on_result_diagnostics",
                "default",
            },
        }
    end,
    condition = {
        filetype = {"python"},
    },
})

vim.api.nvim_create_user_command("WatchFormat", function()
  local overseer = require("overseer")
  overseer.run_template({ name = "Python Format" }, function(task)
    if task then
      task:add_component({ "format_on_save", path = vim.fn.expand("%:p") })
      local main_win = vim.api.nvim_get_current_win()
      overseer.run_action(task, "open vsplit")
      vim.api.nvim_set_current_win(main_win)
    else
      vim.notify("WatchFormat not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
    end
  end)
end, {})
