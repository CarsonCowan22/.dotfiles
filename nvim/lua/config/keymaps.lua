-- Key mappings for AstroNvim-style configuration
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

-- Horizontal scrolling
map("n", "zh", "zh", opts)  -- Scroll left
map("n", "zl", "zl", opts)  -- Scroll right
map("n", "zH", "zH", opts)  -- Scroll left half screen
map("n", "zL", "zL", opts)  -- Scroll right half screen

-- File navigation with Oil.nvim
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Old Files" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Grep String" })

-- Telescope Git mappings
map("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Git Files" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git Branches" })
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })

-- Buffer navigation
map("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next Buffer" })
map("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })

-- Window management
map("n", "<leader>wv", "<C-w>v", { desc = "Split Vertically" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split Horizontally" })
map("n", "<leader>wq", "<C-w>q", { desc = "Close Window" })
map("n", "<leader>wo", "<C-w>o", { desc = "Close Other Windows" })

-- Terminal
map("n", "<leader>t", "<cmd>terminal<cr>", { desc = "Open Terminal" })
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Project-specific mappings
map("n", "<leader>pd", "<cmd>PnpmDev<cr>", { desc = "Pnpm Dev" })
map("n", "<leader>pb", "<cmd>PnpmBuild<cr>", { desc = "Pnpm Build" })
map("n", "<leader>pl", "<cmd>PnpmLint<cr>", { desc = "Pnpm Lint" })
map("n", "<leader>pm", "<cmd>PnpmMigrationRun<cr>", { desc = "Pnpm Migration Run" })

-- Which-Key mappings
map("n", "<leader>?", function()
  require("which-key").show({ global = true })
end, { desc = "Which-Key: all mappings" })

-- Message and debugging mappings
map("n", "<leader>m", "<cmd>messages<cr>", { desc = "Show messages" })
map("n", "<leader>h", "<cmd>checkhealth<cr>", { desc = "Check health" })
map("n", "<leader>l", "<cmd>LspLog<cr>", { desc = "Show LSP log" })
map("n", "<leader>n", "<cmd>Noice<cr>", { desc = "Show Noice history" })

-- LSP control mappings
map("n", "<leader>r", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })
map("n", "<leader>s", "<cmd>LspStop<cr>", { desc = "Stop LSP" })

-- AI/Copilot control mappings
map("n", "<leader>cp", "<cmd>CopilotRestart<cr>", { desc = "Restart Copilot" })
map("n", "<leader>cc", "<cmd>CopilotClear<cr>", { desc = "Clear Copilot suggestions" })
map("n", "<leader>cr", "<cmd>CopilotReset<cr>", { desc = "Reset Copilot completely" })

-- Performance and debugging mappings
map("n", "<leader>p", "<cmd>PerformanceCheck<cr>", { desc = "Check performance metrics" })
map("n", "<leader>fv", "<cmd>FasterStatus<cr>", { desc = "Check Faster.nvim status" })
map("n", "<leader>tc", "<cmd>TestCompletion<cr>", { desc = "Test completion" })
map("n", "<leader>ea", "<cmd>EnableAutoComplete<cr>", { desc = "Enable auto-completion" })

-- Git mappings
map("n", "<leader>gs", "<cmd>GitStatus<cr>", { desc = "Git status" })
map("n", "<leader>ga", "<cmd>GitAdd<cr>", { desc = "Git add all" })
map("n", "<leader>gc", "<cmd>GitCommit<cr>", { desc = "Git commit" })
map("n", "<leader>gp", "<cmd>GitPush<cr>", { desc = "Git push" })
map("n", "<leader>gl", "<cmd>GitPull<cr>", { desc = "Git pull" })
map("n", "<leader>gd", "<cmd>GitDiff<cr>", { desc = "Git diff view" })
map("n", "<leader>gb", "<cmd>GitBlame<cr>", { desc = "Git blame toggle" })
map("n", "<leader>glo", "<cmd>GitLog<cr>", { desc = "Git log" })
map("n", "<leader>gbr", "<cmd>GitBranch<cr>", { desc = "Git branch" })
map("n", "<leader>gco", "<cmd>GitCheckout<cr>", { desc = "Git checkout" })
map("n", "<leader>gm", "<cmd>GitMerge<cr>", { desc = "Git merge" })
map("n", "<leader>gst", "<cmd>GitStash<cr>", { desc = "Git stash" })
map("n", "<leader>gsp", "<cmd>GitStashPop<cr>", { desc = "Git stash pop" })
map("n", "<leader>gsl", "<cmd>GitStashList<cr>", { desc = "Git stash list" })
map("n", "<leader>gr", "<cmd>GitReset<cr>", { desc = "Git reset" })
map("n", "<leader>gre", "<cmd>GitRemote<cr>", { desc = "Git remote" })
map("n", "<leader>gf", "<cmd>GitFetch<cr>", { desc = "Git fetch" })

-- Quick navigation for Next.js project structure
map("n", "<leader>fa", function()
  local utils = require("utils")
  local project_root = utils.get_project_root()
  vim.cmd("e " .. vim.fn.fnameescape(project_root .. "/src/app/"))
end, { desc = "Open app directory" })

map("n", "<leader>fc", function()
  local utils = require("utils")
  local project_root = utils.get_project_root()
  vim.cmd("e " .. vim.fn.fnameescape(project_root .. "/src/components/"))
end, { desc = "Open components directory" })

map("n", "<leader>fl", function()
  local utils = require("utils")
  local project_root = utils.get_project_root()
  vim.cmd("e " .. vim.fn.fnameescape(project_root .. "/src/lib/"))
end, { desc = "Open lib directory" })

map("n", "<leader>ft", function()
  local utils = require("utils")
  local project_root = utils.get_project_root()
  vim.cmd("e " .. vim.fn.fnameescape(project_root .. "/src/types/"))
end, { desc = "Open types directory" })

-- Command-line completion enhancements
map("c", "<Tab>", "<C-n>", { noremap = false })  -- Tab cycles forward through completions
map("c", "<S-Tab>", "<C-p>", { noremap = false })  -- Shift+Tab cycles backward through completions
map("c", "<C-j>", "<C-n>", { noremap = false })  -- Ctrl+j cycles forward
map("c", "<C-k>", "<C-p>", { noremap = false })  -- Ctrl+k cycles backward
