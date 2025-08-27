-- Utils module for AstroNvim-style configuration
local M = {}

-- Check if a plugin is loaded
function M.has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

-- LSP handler function
function M.lsp_handler(server_name)
  local server = require("lspconfig")[server_name]
  local opts = require("lazy.core.config").plugins["nvim-lspconfig"].opts.servers[server_name] or {}
  opts.capabilities = require("cmp_nvim_lsp").default_capabilities()
  server.setup(opts)
end

-- On attach function for LSP
function M.on_attach(callback)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      callback(client, buffer)
    end,
  })
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

-- Check if a buffer is valid
function M.is_buffer_valid(bufnr)
  return bufnr and vim.api.nvim_buf_is_valid(bufnr)
end

-- Safely execute a function with buffer validation
function M.safe_buffer_operation(bufnr, operation)
  if M.is_buffer_valid(bufnr) then
    return pcall(operation)
  end
  return false, "Invalid buffer"
end

-- Clear Copilot suggestions safely
function M.safe_copilot_clear()
  pcall(function()
    local copilot = require("copilot")
    if copilot and copilot.suggestion and copilot.suggestion.clear then
      copilot.suggestion.clear()
    end
  end)
end

-- Restart Copilot safely
function M.safe_copilot_restart()
  pcall(function()
    local copilot = require("copilot")
    if copilot then
      if copilot.suggestion and copilot.suggestion.clear then
        copilot.suggestion.clear()
      end
      if copilot.client and copilot.client.stop then
        copilot.client.stop()
      end
      require("copilot").setup()
    end
  end)
end

return M
