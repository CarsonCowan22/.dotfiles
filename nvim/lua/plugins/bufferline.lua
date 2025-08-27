return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = function()
    -- Try to get Catppuccin highlights, but don't fail if not available
    local highlights = nil
    local ok, cat = pcall(require, "catppuccin.groups.integrations.bufferline")
    if ok then
      -- Try different possible method names
      if cat.get_bufferline then
        highlights = cat.get_bufferline()
      elseif cat.get then
        highlights = cat.get()
      end
    end
    
    return {
      highlights = highlights,
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        separator_style = "slant", -- "rounded" or "thick" or "thin"
        offsets = { { filetype = "neo-tree", text = "Explorer", padding = 1 } },
      },
    }
  end,
}
