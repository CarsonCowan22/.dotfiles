-- Custom commands
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

-- Quick file creation commands
api.nvim_create_user_command("NewComponent", function(args)
  local name = args.args
  if name == "" then
    name = vim.fn.input("Component name: ")
  end
  if name ~= "" then
    local utils = require("utils.helpers")
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
    local utils = require("utils.helpers")
    local project_root = utils.get_project_root()
    local page_path = project_root .. "/src/app/" .. name .. "/page.tsx"
    vim.cmd("e " .. vim.fn.fnameescape(page_path))
  end
end, { nargs = "?" })
