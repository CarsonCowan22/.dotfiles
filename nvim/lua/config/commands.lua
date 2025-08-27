-- Commands configuration for AstroNvim-style setup
local api = vim.api

-- Project-specific commands
api.nvim_create_user_command("PnpmDev", "!pnpm dev", {})
api.nvim_create_user_command("PnpmBuild", "!pnpm build", {})
api.nvim_create_user_command("PnpmLint", "!pnpm lint", {})
api.nvim_create_user_command("PnpmMigrationRun", "!pnpm migration:run", {})
api.nvim_create_user_command("PnpmMigrationGenerate", "!pnpm migration:generate", {})
api.nvim_create_user_command("PnpmMigrationRevert", "!pnpm migration:revert", {})

-- Utility commands
api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({ async = false })
end, {})

api.nvim_create_user_command("Lint", function()
  vim.cmd("!eslint --fix " .. vim.fn.expand("%"))
end, {})

api.nvim_create_user_command("LintProject", function()
  vim.cmd("!pnpm lint")
end, {})

api.nvim_create_user_command("Noice", function()
  require("noice").cmd("history")
end, {})

-- LSP commands
api.nvim_create_user_command("LspRestart", function()
  local utils = require("utils")
  utils.safe_copilot_clear()
  vim.cmd("LspRestart")
  vim.notify("LSP restarted and Copilot cleared", vim.log.levels.INFO)
end, {})

api.nvim_create_user_command("LspStop", function()
  vim.cmd("LspStop")
end, {})

-- AI/Copilot commands
api.nvim_create_user_command("CopilotRestart", function()
  local utils = require("utils")
  utils.safe_copilot_restart()
  vim.notify("Copilot restarted successfully", vim.log.levels.INFO)
end, {})

api.nvim_create_user_command("CopilotReset", function()
  pcall(function()
    local copilot = require("copilot")
    if copilot then
      if copilot.suggestion and copilot.suggestion.clear then
        copilot.suggestion.clear()
      end
      if copilot.client and copilot.client.stop then
        copilot.client.stop()
      end
      if copilot.client and copilot.client.clear_cache then
        copilot.client.clear_cache()
      end
    end
  end)
  require("copilot").setup()
  vim.notify("Copilot completely reset", vim.log.levels.INFO)
end, {})

api.nvim_create_user_command("CopilotClear", function()
  local utils = require("utils")
  utils.safe_copilot_clear()
  vim.notify("Copilot suggestions cleared", vim.log.levels.INFO)
end, {})

-- Testing commands
api.nvim_create_user_command("TestTelescope", function()
  local ok, telescope = pcall(require, "telescope")
  if ok then
    vim.notify("Telescope is available", vim.log.levels.INFO)
    pcall(function()
      telescope.builtin.find_files()
    end)
  else
    vim.notify("Telescope is not available", vim.log.levels.ERROR)
  end
end, {})

api.nvim_create_user_command("CheckTools", function()
  local tools = {
    rg = vim.fn.executable("rg") == 1,
    grep = vim.fn.executable("grep") == 1,
    findstr = vim.fn.executable("findstr") == 1,
    find = vim.fn.executable("find") == 1,
  }
  
  local status = "Available tools:\n"
  for tool, available in pairs(tools) do
    status = status .. "  " .. tool .. ": " .. (available and "✅" or "❌") .. "\n"
  end
  
  vim.notify(status, vim.log.levels.INFO)
end, {})

api.nvim_create_user_command("TestCompletion", function()
  local ok, cmp = pcall(require, "cmp")
  if ok then
    vim.notify("nvim-cmp is available", vim.log.levels.INFO)
    cmp.complete()
    vim.notify("Completion triggered", vim.log.levels.INFO)
  else
    vim.notify("nvim-cmp not available", vim.log.levels.ERROR)
  end
end, {})

api.nvim_create_user_command("EnableAutoComplete", function()
  local ok, cmp = pcall(require, "cmp")
  if ok then
    cmp.setup({
      completion = {
        autocomplete = {
          cmp.TriggerEvent.TextChanged,
          cmp.TriggerEvent.InsertEnter,
          cmp.TriggerEvent.CursorHold,
        },
      },
    })
    vim.notify("Auto-completion enabled", vim.log.levels.INFO)
  else
    vim.notify("nvim-cmp not available", vim.log.levels.ERROR)
  end
end, {})

-- Performance commands
api.nvim_create_user_command("PerformanceCheck", function()
  local startup_time = vim.fn.reltimefloat(vim.fn.reltime())
  local memory_usage = vim.fn.system("tasklist /FI \"IMAGENAME eq nvim.exe\" /FO CSV /NH")
  
  local status = string.format("Performance Metrics:\nStartup time: %.3f seconds\nMemory: %s", 
    startup_time, memory_usage:gsub("\n", ""))
  
  vim.notify(status, vim.log.levels.INFO)
end, {})

-- Git commands
api.nvim_create_user_command("GitStatus", function()
  vim.cmd("Git status")
end, {})

api.nvim_create_user_command("GitAdd", function(args)
  if args.args == "" then
    vim.cmd("Git add .")
  else
    vim.cmd("Git add " .. args.args)
  end
end, { nargs = "?" })

api.nvim_create_user_command("GitCommit", function(args)
  if args.args == "" then
    vim.cmd("Git commit")
  else
    vim.cmd("Git commit -m \"" .. args.args .. "\"")
  end
end, { nargs = "?" })

api.nvim_create_user_command("GitPush", function(args)
  if args.args == "" then
    vim.cmd("Git push")
  else
    vim.cmd("Git push " .. args.args)
  end
end, { nargs = "?" })

api.nvim_create_user_command("GitPull", function(args)
  if args.args == "" then
    vim.cmd("Git pull")
  else
    vim.cmd("Git pull " .. args.args)
  end
end, { nargs = "?" })

api.nvim_create_user_command("GitLog", function()
  vim.cmd("Git log --oneline")
end, {})

api.nvim_create_user_command("GitDiff", function()
  vim.cmd("DiffviewOpen")
end, {})

api.nvim_create_user_command("GitBlame", function()
  vim.cmd("GitBlameToggle")
end, {})

api.nvim_create_user_command("GitBranch", function(args)
  if args.args == "" then
    vim.cmd("Git branch")
  else
    vim.cmd("Git checkout -b " .. args.args)
  end
end, { nargs = "?" })

api.nvim_create_user_command("GitCheckout", function(args)
  if args.args == "" then
    vim.cmd("Git checkout")
  else
    vim.cmd("Git checkout " .. args.args)
  end
end, { nargs = "?" })

api.nvim_create_user_command("GitMerge", function(args)
  if args.args == "" then
    vim.notify("Please specify a branch to merge", vim.log.levels.WARN)
  else
    vim.cmd("Git merge " .. args.args)
  end
end, { nargs = 1 })

api.nvim_create_user_command("GitStash", function(args)
  if args.args == "" then
    vim.cmd("Git stash")
  else
    vim.cmd("Git stash push -m \"" .. args.args .. "\"")
  end
end, { nargs = "?" })

api.nvim_create_user_command("GitStashPop", function()
  vim.cmd("Git stash pop")
end, {})

api.nvim_create_user_command("GitStashList", function()
  vim.cmd("Git stash list")
end, {})

api.nvim_create_user_command("GitReset", function(args)
  if args.args == "" then
    vim.cmd("Git reset HEAD")
  else
    vim.cmd("Git reset " .. args.args)
  end
end, { nargs = "?" })

api.nvim_create_user_command("GitRemote", function()
  vim.cmd("Git remote -v")
end, {})

api.nvim_create_user_command("GitFetch", function(args)
  if args.args == "" then
    vim.cmd("Git fetch")
  else
    vim.cmd("Git fetch " .. args.args)
  end
end, { nargs = "?" })

-- Quick file creation commands
api.nvim_create_user_command("NewComponent", function(args)
  local name = args.args
  if name == "" then
    name = vim.fn.input("Component name: ")
  end
  if name ~= "" then
    local utils = require("utils")
    local project_root = utils.get_project_root()
    local component_path = project_root .. "/src/components/" .. name .. ".tsx"
    vim.cmd("e " .. vim.fn.fnameescape(component_path))
  end
end, { nargs = "?" })

api.nvim_create_user_command("NewPage", function(args)
  local name = args.args
  if name == "" then
    name = vim.fn.input("Page name: ")
  end
  if name ~= "" then
    local utils = require("utils")
    local project_root = utils.get_project_root()
    local page_path = project_root .. "/src/app/" .. name .. "/page.tsx"
    vim.cmd("e " .. vim.fn.fnameescape(page_path))
  end
end, { nargs = "?" })
