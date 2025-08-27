-- Prettier integration
return {
  {
    "prettier/vim-prettier",
    build = "npm install",
    config = function()
      vim.g["prettier#autoformat"] = 0
      vim.g["prettier#autoformat_require_pragma"] = 0
    end,
  },
}
