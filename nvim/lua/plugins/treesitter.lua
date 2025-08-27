-- Treesitter configuration
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "typescript", "tsx", "javascript", "jsx", "json", "yaml", "lua", "vim", "bash",
          "css", "scss", "html", "markdown", "toml", "dockerfile"
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        context_commentstring = { enable = true },
      })
    end,
  },
}
