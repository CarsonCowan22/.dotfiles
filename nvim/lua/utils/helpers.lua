-- Utility functions
local M = {}

-- Check if a plugin is loaded
function M.has_plugin(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

-- Get the current file type
function M.get_filetype()
  return vim.bo.filetype
end

-- Check if the current file is a TypeScript/JavaScript file
function M.is_ts_js_file()
  local ft = M.get_filetype()
  return ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact"
end

-- Get the project root directory
function M.get_project_root()
  local cwd = vim.fn.getcwd()
  if string.find(cwd, "privix") then
    -- Try different possible paths for the Privix project
    local privix_paths = {
      "/c/Users/carso/Documents/privix",
      "C:/Users/carso/Documents/privix",
      vim.fn.expand("~/Documents/privix")
    }
    
    for _, path in ipairs(privix_paths) do
      if vim.fn.isdirectory(path) == 1 then
        return path
      end
    end
    
    -- If none of the expected paths exist, return current directory
    return cwd
  end
  return cwd
end

-- Create a new component file
function M.create_component(name)
  if name and name ~= "" then
    local path = M.get_project_root() .. "/src/components/" .. name .. ".tsx"
    vim.cmd("e " .. path)
  end
end

-- Create a new page file
function M.create_page(name)
  if name and name ~= "" then
    local path = M.get_project_root() .. "/src/app/" .. name .. "/page.tsx"
    vim.cmd("e " .. path)
  end
end

return M
