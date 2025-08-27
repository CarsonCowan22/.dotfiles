-- Treesitter configuration
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Set environment variable for compiler
      vim.env.CC = "gcc"
      
      -- Configure treesitter to use gcc and handle missing compiler gracefully
      local install = require("nvim-treesitter.install")
      install.compilers = { "gcc", "cc", "clang", "cl" }
      
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "typescript", "tsx", "javascript", "json", "yaml", "lua", "vim", "bash",
          "css", "scss", "html", "markdown", "toml", "dockerfile"
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        context_commentstring = { enable = true },
        auto_install = false, -- Disable auto-install to prevent errors
      })
    end,
  },
}
