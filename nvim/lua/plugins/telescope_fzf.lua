return {
  "nvim-telescope/telescope-fzf-native.nvim",
  build = function()
    -- Skip build on Windows to avoid compilation issues
    if vim.fn.has("win32") == 1 then
      vim.notify("telescope-fzf: Skipping build on Windows", vim.log.levels.INFO)
      return
    end
    -- Try to build on other platforms
    local build_cmd = "make"
    if vim.fn.executable("mingw32-make") == 1 then
      build_cmd = "mingw32-make"
    elseif vim.fn.executable("gmake") == 1 then
      build_cmd = "gmake"
    end
    vim.cmd("!" .. build_cmd)
  end,
  config = function() 
    -- Only load if the extension is available
    local telescope_ok, telescope = pcall(require, "telescope")
    if telescope_ok then
      local load_ok, _ = pcall(telescope.load_extension, "fzf")
      if load_ok then
        vim.notify("telescope-fzf: Extension loaded successfully", vim.log.levels.INFO)
      else
        vim.notify("telescope-fzf: Extension not available, skipping", vim.log.levels.WARN)
      end
    else
      vim.notify("telescope-fzf: Telescope not available, skipping", vim.log.levels.WARN)
    end
  end,
}
