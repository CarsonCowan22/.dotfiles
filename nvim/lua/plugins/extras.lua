-- Extras configuration with additional plugins
return {
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
  {
    "echasnovski/mini.surround",
    keys = function(_, keys)
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete surrounding" },
        { opts.mappings.find, desc = "Find surrounding" },
        { opts.mappings.find_left, desc = "Find surrounding left" },
        { opts.mappings.highlight, desc = "Highlight surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gza",
        delete = "gzd",
        find = "gzf",
        find_left = "gzF",
        highlight = "gzh",
        replace = "gzr",
        update_n_lines = "gzn",
      },
    },
    config = function(_, opts)
      require("mini.surround").setup(opts)
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = false,
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      local bracketed = require("mini.bracketed")
      bracketed.setup(opts)
    end,
  },
  {
    "echasnovski/mini.move",
    keys = {
      { "<A-j>", mode = { "n", "x", "o" }, desc = "Move down" },
      { "<A-k>", mode = { "n", "x", "o" }, desc = "Move up" },
      { "<A-h>", mode = { "n", "x", "o" }, desc = "Move left" },
      { "<A-l>", mode = { "n", "x", "o" }, desc = "Move right" },
    },
    opts = {
      mappings = {
        down = "<A-j>",
        up = "<A-k>",
        left = "<A-h>",
        right = "<A-l>",
        line_down = "<A-j>",
        line_up = "<A-k>",
        line_left = "<A-h>",
        line_right = "<A-l>",
      },
    },
    config = function(_, opts)
      require("mini.move").setup(opts)
    end,
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          t = { "<(.-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]*>$" },
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },
  {
    "echasnovski/mini.files",
    version = false,
    opts = {
      windows = {
        preview = true,
        width_focus = 50,
        width_preview = 50,
      },
      options = {
        use_as_default_explorer = false,
      },
    },
    keys = {
      {
        "-",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>-",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      local show_dotfiles = true
      local filter_show = function(fs_entry) return true end
      local filter_hide = function(fs_entry) return not vim.startswith(fs_entry.name, ".") end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        require("mini.files").refresh({ content = { filter = new_filter } })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
          end

          map("H", "~", "Go to parent directory")
          map("h", "-", "Go to parent directory")
          map("l", "<CR>", "Go to child directory or open file")
          map("L", "<CR>", "Go to child directory or open file")
          map("I", toggle_dotfiles, "Toggle dotfiles")
          map("a", "ma", "Go to previous visited directory")
          map("d", "md", "Go to next visited directory")
          map("r", "mr", "Refresh explorer")
          map("R", "mR", "Refresh explorer")
          map("c", "mc", "Close explorer")
          map("z", "mz", "Close explorer")
          map("v", "mv", "Open in vertical split")
          map("s", "ms", "Open in horizontal split")
          map("p", "mp", "Open in new tab")
          map("t", "mt", "Open in new tab")
          map("y", "my", "Copy to clipboard")
          map("Y", "mY", "Copy to clipboard")
          map("x", "mx", "Cut to clipboard")
          map("X", "mX", "Cut to clipboard")
          map("D", "mD", "Delete")
          map("A", "mA", "Create new file")
          map("a", "ma", "Create new file")
        end,
      })
    end,
  },
}
