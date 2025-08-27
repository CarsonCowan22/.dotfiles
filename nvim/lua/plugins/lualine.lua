-- Status line configuration to match Cursor UI
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              separator = { left = "", right = "" },
              right_padding = 2,
            },
          },
          lualine_b = {
            {
              "branch",
              icon = " ",
              separator = { left = "", right = "" },
              right_padding = 2,
            },
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
              separator = { left = "", right = "" },
              right_padding = 2,
            },
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              separator = { left = "", right = "" },
              right_padding = 2,
            },
          },
          lualine_c = {
            {
              "filename",
              path = 1,
              separator = { left = "", right = "" },
              right_padding = 2,
            },
          },
          lualine_x = {
            {
              "encoding",
              separator = { left = "", right = "" },
              right_padding = 2,
            },
            {
              "fileformat",
              separator = { left = "", right = "" },
              right_padding = 2,
            },
            {
              "filetype",
              separator = { left = "", right = "" },
              right_padding = 2,
            },
          },
          lualine_y = {
            {
              "progress",
              separator = { left = "", right = "" },
              left_padding = 2,
            },
          },
          lualine_z = {
            {
              "location",
              separator = { left = "", right = "" },
              left_padding = 2,
            },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = { "neo-tree" },
      })
    end,
  },
}
