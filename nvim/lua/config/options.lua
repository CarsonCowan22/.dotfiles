-- Basic Neovim options to match Cursor UI
local opt = vim.opt

-- Editor behavior
opt.number = true
opt.relativenumber = true
opt.mouse = 'a'
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.wrap = false
opt.breakindent = true
opt.linebreak = true
opt.showbreak = "↪ "
opt.list = false
opt.listchars = { tab = "→ ", eol = "↲", nbsp = "␣", trail = "•", extends = "❯", precedes = "❮" }

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.cindent = true

-- Visual
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.cursorline = true
opt.cursorcolumn = false
opt.colorcolumn = "80"
opt.signcolumn = "yes"
opt.showmatch = true
opt.matchtime = 2
opt.matchpairs:append("<:>")

-- System
opt.clipboard = 'unnamedplus'
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.directory = vim.fn.stdpath("data") .. "/swap"
opt.completeopt = "menuone,noselect"
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore = "*.o,*.obj,*.dylib,*.bin,*.dll,*.so,*.swp,*.swo,*~,*.pyc,__pycache__,*.egg-info,.pytest_cache,.coverage,htmlcov,dist,build,eggs,*.egg,.eggs,node_modules,.git,.hg,.svn,.bzr,.DS_Store,Thumbs.db"

-- Performance
opt.lazyredraw = true
opt.updatetime = 300
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.redrawtime = 1500
opt.synmaxcol = 240
opt.maxmempattern = 640

-- File type specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.textwidth = 80
  end,
})

-- Cursor-like window behavior
opt.splitbelow = true
opt.splitright = true
opt.equalalways = false
opt.laststatus = 3
opt.showtabline = 2
