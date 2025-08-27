-- Key mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General mappings
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- File navigation
map("n", "<leader>e", ":Neotree toggle<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Buffer navigation
map("n", "<leader>bn", ":bn<CR>", opts)
map("n", "<leader>bp", ":bp<CR>", opts)
map("n", "<leader>bd", ":bd<CR>", opts)

-- LSP mappings
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>f", vim.lsp.buf.format, opts)
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
map("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)

-- Diagnostic mappings
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<leader>dl", vim.diagnostic.setloclist, opts)

-- Terminal
map("n", "<leader>t", ":terminal<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Project-specific mappings
map("n", "<leader>pd", ":PnpmDev<CR>", opts)
map("n", "<leader>pb", ":PnpmBuild<CR>", opts)
map("n", "<leader>pl", ":PnpmLint<CR>", opts)
map("n", "<leader>pm", ":PnpmMigrationRun<CR>", opts)

-- Quick navigation for Next.js project structure
map("n", "<leader>fa", function()
  local utils = require("utils.helpers")
  local project_root = utils.get_project_root()
  vim.cmd("e " .. vim.fn.fnameescape(project_root .. "/src/app/"))
end, opts)
map("n", "<leader>fc", function()
  local utils = require("utils.helpers")
  local project_root = utils.get_project_root()
  vim.cmd("e " .. vim.fn.fnameescape(project_root .. "/src/components/"))
end, opts)
map("n", "<leader>fl", function()
  local utils = require("utils.helpers")
  local project_root = utils.get_project_root()
  vim.cmd("e " .. vim.fn.fnameescape(project_root .. "/src/lib/"))
end, opts)
map("n", "<leader>ft", function()
  local utils = require("utils.helpers")
  local project_root = utils.get_project_root()
  vim.cmd("e " .. vim.fn.fnameescape(project_root .. "/src/types/"))
end, opts)
