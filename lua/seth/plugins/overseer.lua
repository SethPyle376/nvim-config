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

local function nearest_maven_module(file)
    local dir = vim.fs.dirname(file)

    while dir do
        local pom = dir .. "/pom.xml"
        if vim.fn.filereadable(pom) == 1 then
            return dir
        end

        local parent = vim.fs.dirname(dir)
        if parent == dir then
            break
        end
        dir = parent
    end

    return nil
end

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     pattern = "*.java",
--     callback = function()
--         local file = vim.fn.expand("%:p")
--         local module_root = nearest_maven_module(file)
--         if not module_root then
--             return
--         end
--
--         -- Prevent concurrent runs
--         if vim.g._mvn_fmt_running then
--             return
--         end
--         vim.g._mvn_fmt_running = true
--
--         vim.system(
--             { "mvn", "fmt:format" },
--             { cwd = module_root },
--             function()
--                 vim.schedule(function()
--                     vim.g._mvn_fmt_running = false
--                     vim.cmd("checktime")
--                 end)
--             end
--         )
--     end,
-- })

