-- Project-specific settings that load after plugins
local api = vim.api

-- Detect if we're in the Privix project
local function is_privix_project()
  local cwd = vim.fn.getcwd()
  return string.find(cwd, "privix") ~= nil
end

-- Load project-specific settings
if is_privix_project() then
  -- Try to set working directory to project root (only if it exists)
  local privix_paths = {
    "/c/Users/carso/Documents/privix",
    "C:/Users/carso/Documents/privix",
    vim.fn.expand("~/Documents/privix")
  }
  
  for _, path in ipairs(privix_paths) do
    if vim.fn.isdirectory(path) == 1 then
      vim.cmd("cd " .. vim.fn.fnameescape(path))
      break
    end
  end
  
  -- Configure for Next.js project structure
  vim.opt.path:append("src/**")
  vim.opt.path:append("components/**")
  vim.opt.path:append("lib/**")
  vim.opt.path:append("types/**")
  
  -- TypeScript strict mode settings
  api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "typescriptreact" },
    callback = function()
      vim.opt_local.ts = 2
      vim.opt_local.sw = 2
      vim.opt_local.expandtab = true
      vim.opt_local.formatoptions = vim.opt_local.formatoptions + "ro"
    end,
  })
  
  -- ESLint integration
  api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
    callback = function()
      vim.cmd("silent! !eslint --fix " .. vim.fn.expand("%"))
    end,
  })
  
  -- Prettier integration
  api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.css", "*.scss" },
    callback = function()
      vim.cmd("silent! !prettier --write " .. vim.fn.expand("%"))
    end,
  })
end
