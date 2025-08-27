-- AI plugins configuration for AstroNvim-style setup
return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      panel = { enabled = false },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<A-l>",
          accept_word = "<A-w>",
          accept_line = "<A-;>",
          next = "<A-]>",
          prev = "<A-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = { markdown = true, gitcommit = true, ["*"] = true },
    },
    config = function(_, opts)
      require("copilot").setup(opts)

      -- Handle buffer lifecycle to prevent buffer ID errors
      local copilot = require("copilot")

      -- Clean up when buffers are deleted
      vim.api.nvim_create_autocmd("BufDelete", {
        callback = function(args)
          pcall(function()
            if copilot and copilot.suggestion and copilot.suggestion.clear then
              copilot.suggestion.clear()
            end
          end)
        end,
      })

      -- Clean up when leaving buffers
      vim.api.nvim_create_autocmd("BufLeave", {
        callback = function(args)
          pcall(function()
            if copilot and copilot.suggestion and copilot.suggestion.clear then
              copilot.suggestion.clear()
            end
          end)
        end,
      })

      -- Handle VimEnter to ensure clean state
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          pcall(function()
            if copilot and copilot.suggestion then
              copilot.suggestion.clear()
            end
          end)
        end,
      })

      -- Handle BufWinLeave to clear suggestions before window closes
      vim.api.nvim_create_autocmd("BufWinLeave", {
        callback = function(args)
          pcall(function()
            if copilot and copilot.suggestion and copilot.suggestion.clear then
              copilot.suggestion.clear()
            end
          end)
        end,
      })

      -- Handle BufHidden to clear suggestions when buffer is hidden
      vim.api.nvim_create_autocmd("BufHidden", {
        callback = function(args)
          pcall(function()
            if copilot and copilot.suggestion and copilot.suggestion.clear then
              copilot.suggestion.clear()
            end
          end)
        end,
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup({
        method = "getCompletionsCycling",
      })
    end,
  },
}