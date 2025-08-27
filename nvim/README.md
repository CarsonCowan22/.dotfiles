# Neovim Configuration for Privix Project

A modular Neovim configuration specifically tailored for Next.js TypeScript development with pnpm, Tailwind CSS, and ESLint. **Designed to match Cursor's UI and experience as closely as possible.**

## Features

- **Language Support**: Full TypeScript/JavaScript support with LSP
- **ESLint Integration**: Automatic linting and error highlighting
- **Tailwind CSS**: IntelliSense for Tailwind classes
- **File Navigation**: Fuzzy finder and file tree
- **Git Integration**: Git signs and status
- **Completion**: Intelligent code completion with snippets
- **Formatting**: Automatic formatting with Prettier
- **Project Commands**: Quick access to pnpm commands
- **Theme**: Cursor-like dark theme with custom color palette
- **Status Line**: Clean status line matching Cursor's design
- **UI Elements**: Rounded borders, modern popups, and smooth animations
- **Notifications**: Cursor-style notification system
- **Command Palette**: Modern command palette with fuzzy search

## Directory Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua      # Basic Neovim options
│   │   ├── keymaps.lua      # Key mappings
│   │   ├── autocmds.lua     # Auto commands
│   │   └── commands.lua     # Custom commands
│   ├── plugins/
│   │   ├── init.lua         # Plugin manager setup
│   │   ├── theme.lua        # Theme configuration
│   │   ├── lsp.lua          # LSP configuration
│   │   ├── completion.lua   # Completion setup
│   │   ├── treesitter.lua   # Treesitter configuration
│   │   ├── telescope.lua    # Telescope configuration
│   │   ├── neotree.lua      # File explorer configuration
│   │   ├── gitsigns.lua     # Git integration
│   │   ├── lualine.lua      # Status line
│   │   ├── autopairs.lua    # Auto pairs
│   │   ├── comment.lua      # Commenting
│   │   ├── indent.lua       # Indent guides
│   │   ├── prettier.lua     # Prettier integration
│   │   ├── notify.lua       # Notification system
│   │   ├── noice.lua        # Command palette & UI
│   │   └── lspkind.lua      # Completion icons
│   └── utils/
│       └── helpers.lua      # Utility functions
└── after/
    └── plugin/
        └── project.lua      # Project-specific settings
```

## Key Mappings

### Leader Key
- `<Space>` - Leader key

### File Navigation
- `<leader>e` - Toggle file explorer (Neo-tree)
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (Telescope)
- `<leader>fb` - Buffer list (Telescope)
- `<leader>fh` - Help tags (Telescope)

### Buffer Navigation
- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer
- `<leader>bd` - Delete buffer

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover
- `<leader>rn` - Rename
- `<leader>ca` - Code actions
- `<leader>f` - Format

### Diagnostics
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>dl` - Show diagnostic list

### Project Commands
- `<leader>pd` - Run `pnpm dev`
- `<leader>pb` - Run `pnpm build`
- `<leader>pl` - Run `pnpm lint`
- `<leader>pm` - Run `pnpm migration:run`

### Quick Navigation
- `<leader>fa` - Open src/app/
- `<leader>fc` - Open src/components/
- `<leader>fl` - Open src/lib/
- `<leader>ft` - Open src/types/

### Git (when in gitsigns buffer)
- `]c` - Next hunk
- `[c` - Previous hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line

## Custom Commands

- `:PnpmDev` - Run development server
- `:PnpmBuild` - Build project
- `:PnpmLint` - Run linter
- `:PnpmMigrationRun` - Run migrations
- `:PnpmMigrationGenerate` - Generate migration
- `:PnpmMigrationRevert` - Revert migration
- `:Format` - Format current file
- `:Lint` - Lint current file
- `:NewComponent <name>` - Create new component
- `:NewPage <name>` - Create new page

## Installation

### Prerequisites

1. **Install Neovim**:
   ```bash
   # On Windows with Chocolatey
   choco install neovim
   
   # Or download from https://github.com/neovim/neovim/releases
   ```

2. **Install Node.js dependencies**:
   ```bash
   # Install TypeScript LSP globally
   npm install -g typescript typescript-language-server
   
   # Install ESLint LSP
   npm install -g @eslint/js
   
   # Install Tailwind CSS LSP
   npm install -g @tailwindcss/language-server
   ```

### Setup

1. **Clone or copy this configuration** to `~/.config/nvim/`

2. **Start Neovim**:
   ```bash
   nvim
   ```

3. **Install plugins**: The plugin manager (lazy.nvim) will automatically install all required plugins on first run.

## Project-Specific Features

This configuration automatically detects when you're working in the Privix project and applies:

- **Working directory**: Automatically changes to `/c/Users/carso/Documents/privix`
- **Path configuration**: Adds `src/`, `components/`, `lib/`, and `types/` to the path
- **TypeScript settings**: Strict mode configuration with 2-space indentation
- **Auto-formatting**: ESLint and Prettier run automatically on save
- **Quick navigation**: Shortcuts for common Next.js project directories

## Plugins Included

- **lazy.nvim** - Plugin manager
- **catppuccin/nvim** - Theme
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP installer
- **nvim-cmp** - Completion
- **nvim-treesitter** - Syntax highlighting
- **telescope.nvim** - Fuzzy finder
- **neo-tree.nvim** - File explorer
- **gitsigns.nvim** - Git integration
- **lualine.nvim** - Status line
- **nvim-autopairs** - Auto pairs
- **Comment.nvim** - Commenting
- **indent-blankline.nvim** - Indent guides
- **vim-prettier** - Prettier integration
- **nvim-notify** - Notification system
- **noice.nvim** - Command palette & UI enhancements
- **lspkind.nvim** - Completion icons

## Customization

### Adding New Plugins

To add a new plugin, create a new file in `lua/plugins/` or add it to an existing plugin file:

```lua
-- lua/plugins/myplugin.lua
return {
  {
    "author/plugin-name",
    config = function()
      -- Plugin configuration
    end,
  },
}
```

### Modifying Key Mappings

Edit `lua/config/keymaps.lua` to add or modify key mappings.

### Changing Theme

Edit `lua/plugins/theme.lua` to change the theme or modify theme settings. The current theme is designed to match Cursor's dark theme.

## Troubleshooting

### LSP Not Working
1. Ensure Node.js is installed
2. Install required LSP servers globally
3. Check Mason for LSP installation status

### Plugins Not Loading
1. Check if lazy.nvim is properly installed
2. Run `:Lazy sync` to sync plugins
3. Check for errors in `:checkhealth`

### Performance Issues
1. Disable unused plugins
2. Check for large files or directories
3. Monitor plugin loading times with `:Lazy profile`

## Contributing

This configuration is modular and easy to extend. Feel free to:
- Add new plugins
- Modify key mappings
- Customize for your specific needs
- Submit improvements

## License

This configuration is provided as-is for educational and development purposes.
