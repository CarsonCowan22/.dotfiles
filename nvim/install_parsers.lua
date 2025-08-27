-- Script to install treesitter parsers with correct compiler
-- Run this with: nvim --headless -l install_parsers.lua

-- Set the compiler
vim.env.CC = "gcc"

-- Install parsers
local parsers = {
  "typescript", "tsx", "javascript", "json", "yaml", "lua", "vim", "bash",
  "css", "scss", "html", "markdown", "toml", "dockerfile"
}

print("Installing treesitter parsers with gcc...")

for _, parser in ipairs(parsers) do
  print("Installing " .. parser .. "...")
  vim.cmd("TSInstall " .. parser)
end

print("Parser installation complete!")
vim.cmd("qa")
