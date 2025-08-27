-- Auto commands
local api = vim.api

-- Auto-format on save for TypeScript/JavaScript files
api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Set up file type associations
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tsx",
  command = "set filetype=typescriptreact",
})

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.jsx",
  command = "set filetype=javascriptreact",
})

-- Project-specific settings
api.nvim_create_autocmd("BufEnter", {
  pattern = "*.{ts,tsx,js,jsx}",
  callback = function()
    -- Set up path for TypeScript imports
    vim.opt_local.path:append("src")
    vim.opt_local.path:append(".")
  end,
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
  end,
})

-- Remove trailing whitespace on save
api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
