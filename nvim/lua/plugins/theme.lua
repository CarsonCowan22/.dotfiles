-- Theme configuration to match Cursor UI
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Dark theme like Cursor
        transparent_background = false,
        term_colors = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          lualine = true,
          indent_blankline = true,
          notify = true,
          which_key = true,
        },
        color_overrides = {
          mocha = {
            -- Cursor-like color palette
            rosewater = "#f5e0dc",
            flamingo = "#f2cdcd",
            pink = "#f5c2e7",
            mauve = "#cba6f7",
            red = "#f38ba8",
            maroon = "#eba0ac",
            peach = "#fab387",
            yellow = "#f9e2af",
            green = "#a6e3a1",
            teal = "#94e2d5",
            sky = "#89dceb",
            sapphire = "#74c7ec",
            blue = "#89b4fa",
            lavender = "#b4befe",
            text = "#cdd6f4",
            subtext1 = "#bac2de",
            subtext0 = "#a6adc8",
            overlay2 = "#9399b2",
            overlay1 = "#7f849c",
            overlay0 = "#6c7086",
            surface2 = "#585b70",
            surface1 = "#45475a",
            surface0 = "#313244",
            base = "#1e1e2e",
            mantle = "#181825",
            crust = "#11111b",
          },
        },
        highlight_overrides = {
          mocha = function(C)
            return {
              -- Cursor-like syntax highlighting
              Comment = { fg = C.overlay0, italic = true },
              String = { fg = C.green },
              Number = { fg = C.peach },
              Boolean = { fg = C.peach },
              Function = { fg = C.blue },
              Keyword = { fg = C.mauve },
              Statement = { fg = C.mauve },
              Type = { fg = C.yellow },
              Identifier = { fg = C.lavender },
              Constant = { fg = C.peach },
              PreProc = { fg = C.mauve },
              Special = { fg = C.pink },
              Delimiter = { fg = C.overlay2 },
              Operator = { fg = C.sky },
              -- LSP highlights
              LspReferenceText = { bg = C.surface0 },
              LspReferenceRead = { bg = C.surface0 },
              LspReferenceWrite = { bg = C.surface0 },
              -- Git highlights
              GitSignsAdd = { fg = C.green },
              GitSignsChange = { fg = C.yellow },
              GitSignsDelete = { fg = C.red },
              -- Diagnostic highlights
              DiagnosticError = { fg = C.red },
              DiagnosticWarn = { fg = C.yellow },
              DiagnosticInfo = { fg = C.blue },
              DiagnosticHint = { fg = C.teal },
            }
          end,
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
