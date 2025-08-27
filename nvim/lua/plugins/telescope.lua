-- Telescope configuration to match Cursor UI
return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    config = function()
      -- Determine available tools
      local has_ripgrep = vim.fn.executable("rg") == 1
      local has_grep = vim.fn.executable("grep") == 1
      local has_findstr = vim.fn.executable("findstr") == 1
      
      -- If ripgrep is not found but we know it's installed, try to add it to PATH
      if not has_ripgrep then
        local ripgrep_path = "C:\\Users\\carso\\AppData\\Local\\Microsoft\\WinGet\\Packages\\BurntSushi.ripgrep.MSVC_Microsoft.Winget.Source_8wekyb3d8bbwe\\ripgrep-14.1.1-x86_64-pc-windows-msvc"
        if vim.fn.isdirectory(ripgrep_path) == 1 then
          vim.env.PATH = ripgrep_path .. ";" .. vim.env.PATH
          has_ripgrep = vim.fn.executable("rg") == 1
          if has_ripgrep then
            vim.notify("Added ripgrep to PATH: " .. ripgrep_path, vim.log.levels.INFO)
          end
        end
      end
      
      -- Choose the best available grep tool
      local grep_tool
      if has_ripgrep then
        grep_tool = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        }
      elseif has_grep then
        grep_tool = {
          "grep",
          "-n",
          "-H",
          "-i",
          "-s",
        }
      elseif has_findstr then
        grep_tool = {
          "findstr",
          "/n",
          "/i",
          "/s",
        }
      else
        -- Fallback to basic findstr
        grep_tool = {
          "findstr",
          "/n",
        }
      end
      
      require("telescope").setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "truncate" },
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          vimgrep_arguments = grep_tool,
          mappings = {
            i = {
              ["<C-n>"] = require("telescope.actions").cycle_history_next,
              ["<C-p>"] = require("telescope.actions").cycle_history_prev,
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
              ["<C-c>"] = require("telescope.actions").close,
              ["<Down>"] = require("telescope.actions").move_selection_next,
              ["<Up>"] = require("telescope.actions").move_selection_previous,
              ["<CR>"] = require("telescope.actions").select_default,
              ["<C-x>"] = require("telescope.actions").select_horizontal,
              ["<C-v>"] = require("telescope.actions").select_vertical,
              ["<C-t>"] = require("telescope.actions").select_tab,
              ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
              ["<C-d>"] = require("telescope.actions").preview_scrolling_down,
              ["<PageUp>"] = require("telescope.actions").results_scrolling_up,
              ["<PageDown>"] = require("telescope.actions").results_scrolling_down,
              ["<Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
              ["<S-Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_better,
              ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
              ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
              ["<C-l>"] = require("telescope.actions").complete_tag,
              ["<C-_>"] = require("telescope.actions").which_key,
            },
            n = {
              ["<esc>"] = require("telescope.actions").close,
              ["<CR>"] = require("telescope.actions").select_default,
              ["<C-x>"] = require("telescope.actions").select_horizontal,
              ["<C-v>"] = require("telescope.actions").select_vertical,
              ["<C-t>"] = require("telescope.actions").select_tab,
              ["<Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
              ["<S-Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_better,
              ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
              ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
              ["j"] = require("telescope.actions").move_selection_next,
              ["k"] = require("telescope.actions").move_selection_previous,
              ["H"] = require("telescope.actions").move_to_top,
              ["M"] = require("telescope.actions").move_to_middle,
              ["L"] = require("telescope.actions").move_to_bottom,
              ["<Down>"] = require("telescope.actions").move_selection_next,
              ["<Up>"] = require("telescope.actions").move_selection_previous,
              ["gg"] = require("telescope.actions").move_to_top,
              ["G"] = require("telescope.actions").move_to_bottom,
              ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
              ["<C-d>"] = require("telescope.actions").preview_scrolling_down,
              ["<PageUp>"] = require("telescope.actions").results_scrolling_up,
              ["<PageDown>"] = require("telescope.actions").results_scrolling_down,
              ["?"] = require("telescope.actions").which_key,
            },
          },
        },
        pickers = {
                     find_files = {
             hidden = true,
             find_command = has_ripgrep and { "rg", "--files", "--hidden", "--glob", "!**/.git/*" } or { "cmd", "/c", "dir", "/b", "/s", "/a-d" },
           },
          live_grep = {
            only_sort_text = true,
          },
          grep_string = {
            only_sort_text = true,
          },
          buffers = {
            initial_mode = "normal",
            mappings = {
              i = {
                ["<C-d>"] = require("telescope.actions").delete_buffer,
              },
              n = {
                ["dd"] = require("telescope.actions").delete_buffer,
              },
            },
          },
          planets = {
            show_pluto = true,
            show_moon = true,
          },
                     git_files = {
             hidden = true,
             show_untracked = true,
           },
           git_commits = {
             git_command = { "git", "log", "--pretty=oneline", "--abbrev-commit", "-n", "5000" },
           },
           git_branches = {
             git_command = { "git", "branch", "--all", "--format=%(refname:short)" },
           },
           git_status = {
             git_command = { "git", "status", "--porcelain" },
           },
          colorscheme = {
            enable_preview = true,
          },
        },
        extensions = {
          -- fzf extension will be loaded separately if available
        },
      })
    end,
  },
}
