# My LunarVim Configuration

This repository contains my personal configuration for LunarVim. It's tailored for my development workflow, with a focus on web development (PHP, JavaScript, Markdown), systems programming (Rust), and general productivity.

## Core Features

- **Custom Keymaps:** Includes convenient keybindings for navigation and plugin access, such as using `Ctrl + h/j/k/l` for cursor movement in insert mode.
- **Extensive Plugin Suite:** A curated list of plugins to enhance the editing experience.
- **Pre-configured LSP:** Language Server Protocol settings are defined for various languages to provide rich features like auto-completion, diagnostics, and go-to-definition.
- **Custom Themes:** A selection of popular and visually appealing color schemes.

## Included Plugins

This configuration adds several plugins to the default LunarVim setup:

### Productivity & UI
- **[obsidian.nvim](https://github.com/epwalsh/obsidian.nvim):** Seamlessly integrates your Obsidian notes into Neovim.
- **[trouble.nvim](https://github.com/folke/trouble.nvim):** A pretty list for diagnostics, references, and more. Toggled with `<leader>tt`.
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim):** Highlights and searches for TODO comments.
- **[nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua):** Previews colors for CSS, HTML, and JavaScript.
- **[presence.nvim](https://github.com/andweeb/presence.nvim):** Discord Rich Presence support.
- **[codestats.nvim](https://github.com/YannickFricke/codestats.nvim):** Tracks coding statistics.

### Language & Development
- **[copilot.lua](https://github.com/zbirenbaum/copilot.lua):** GitHub Copilot integration.
- **[flutter-tools.nvim](https://github.com/akinsho/flutter-tools.nvim):** Tools for Flutter development.
- **[rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim):** Extra features for Rust development.
- **[phpactor.nvim](https://github.com/gbprod/phpactor.nvim):** LSP features for PHP.
- **[markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim):** Live Markdown preview in your browser.

### Themes
- Catppuccin
- Dracula
- Gruvbox
- Tokyodark
- Visual Studio Code
- And more...

## Keybindings

Some notable custom keybindings include:

| Keybinding        | Action                      | Mode   |
| ----------------- | --------------------------- | ------ |
| `<C-h>`           | Move cursor left            | Insert |
| `<C-j>`           | Move cursor down            | Insert |
| `<C-k>`           | Move cursor up              | Insert |
| `<C-l>`           | Move cursor right           | Insert |
| `<leader>tt`      | Toggle Trouble diagnostics  | Normal |

## Installation

1.  **Prerequisite:** Install [LunarVim](https://www.lunarvim.org/docs/installation).
2.  Clone this repository to your LunarVim config directory:
    ```sh
    git clone https://github.com/<your-username>/<your-repo-name> ~/.config/lvim
    ```
3.  Start LunarVim and run `:LvimSyncCorePlugins` to install all the plugins.

## Directory Structure

- `config.lua`: The main entry point for the configuration.
- `lua/user/`: Contains all user-specific customizations.
  - `plugins.lua`: Defines the list of additional plugins.
  - `keymaps.lua`: Sets custom keybindings.
  - `options.lua`: Configures Neovim options.
  - `lspconfig.lua`: Custom configurations for language servers.
- `lsp-settings/`: JSON files for fine-tuning specific language server settings.