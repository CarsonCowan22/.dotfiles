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
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
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
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
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
          colorscheme = {
            enable_preview = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
    end,
  },
}
