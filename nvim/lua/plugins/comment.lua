-- Commenting configuration
return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<leader>cc",
          block = "<leader>cb",
        },
        opleader = {
          line = "<leader>c",
          block = "<leader>b",
        },
      })
    end,
  },
}
