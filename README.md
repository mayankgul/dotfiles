# Dotfiles

My personal macOS development environment, built around a keyboard-driven workflow, a consistent Gruvbox Material aesthetic, and a collection of carefully configured terminal and productivity tools.

This repository contains my configurations for the shell, terminal emulator, Neovim, window management, file navigation, and other command-line utilities.

> These are personal configurations, not a universal setup script. Some settings depend on my installed applications, hardware, and local environment. Review the configurations before using them on your machine.

## Overview

| Component              | Tool                                                       | Description                                      |
| ---------------------- | ---------------------------------------------------------- | ------------------------------------------------ |
| Shell                  | [Zsh](https://www.zsh.org/)                                | Modular shell configuration and custom aliases   |
| Shell framework        | [Oh My Zsh](https://ohmyz.sh/)                             | Plugin management and shell enhancements         |
| Prompt                 | [Oh My Posh](https://ohmyposh.dev/)                        | Custom Gruvbox Material prompt                   |
| Terminal               | [WezTerm](https://wezfurlong.org/wezterm/)                 | GPU-accelerated terminal emulator                |
| Multiplexer            | [tmux](https://github.com/tmux/tmux)                       | Terminal sessions, panes, and custom status line |
| Editor                 | [Neovim](https://neovim.io/)                               | LazyVim-based configuration                      |
| File manager           | [Yazi](https://github.com/sxyazi/yazi)                     | Terminal-based file manager                      |
| Window manager         | [yabai](https://github.com/koekeishiya/yabai)              | Tiling window management                         |
| Hotkey daemon          | [skhd](https://github.com/koekeishiya/skhd)                | Keyboard shortcuts and window controls           |
| Keyboard customization | [Karabiner-Elements](https://karabiner-elements.pqrs.org/) | Keyboard remapping                               |
| Session manager        | [sesh](https://github.com/joshmedeski/sesh)                | tmux session management                          |
| Shell history          | [Atuin](https://github.com/atuinsh/atuin)                  | Searchable shell history                         |
| Git UI                 | [lazygit](https://github.com/jesseduffield/lazygit)        | Terminal-based Git interface                     |
| Task management        | [Taskwarrior](https://taskwarrior.org/)                    | Command-line task management                     |
| System information     | [Fastfetch](https://github.com/fastfetch-cli/fastfetch)    | System information display                       |

Additional configurations are included for `bat`, `btop`, `Pomoru`, and other utilities.

## Repository Structure

```text
.
├── .gitattributes
├── .gitignore
└── dotfiles/
    ├── home/
    │   └── .zshrc
    │
    └── config/
        ├── atuin/
        ├── bat/
        ├── btop/
        ├── fastfetch/
        ├── karabiner/
        ├── lazygit/
        ├── nvim/
        ├── ohmyposh/
        ├── pomoru/
        ├── sesh/
        ├── skhd/
        ├── task/
        ├── tmux/
        ├── wezterm/
        ├── yabai/
        ├── yazi/
        └── zsh/
```

The repository follows a simple organization:

- `dotfiles/home/` contains files intended for the home directory.
- `dotfiles/config/` contains application configurations intended for `~/.config/`.

## Highlights

### Shell

The Zsh configuration is split into smaller files, each responsible for a particular aspect of the shell:

- `path.zsh` — PATH configuration.
- `environment.zsh` — Environment variables.
- `plugins.zsh` — Oh My Zsh and its plugins.
- `completion.zsh` — Shell completion.
- `history.zsh` — History configuration.
- `fzf.zsh` — FZF appearance and behavior.
- `tools.zsh` — Integrations such as Atuin and zoxide.
- `alias.zsh` — Custom aliases.
- `yazi.zsh` — Yazi shell integration.
- `vi-mode.zsh` — Vi-mode configuration.
- `prompt.zsh` — Oh My Posh initialization and prompt customization.

The main `.zshrc` sources these modules in sequence, keeping the configuration organized and easier to maintain.

### Neovim

A customized [LazyVim](https://www.lazyvim.org/) setup with plugins organized by functionality.

The configuration includes:

- Editing enhancements and navigation.
- LSP and language-related tooling.
- Debugging and task execution.
- Git integration.
- File explorers and search.
- Markdown and note-taking workflows.
- Custom UI components and status line.
- Gruvbox Material colorscheme.
- AI-assisted development integrations.

The plugin specifications are maintained under `nvim/lua/plugins/`, while custom utilities and shared functionality live under `nvim/lua/utils/`.

The `lazy-lock.json` file records the plugin versions used by the setup.

### tmux

A modular tmux configuration with separate files for:

- Terminal capabilities.
- Appearance and pane styling.
- Keybindings.
- Status line.
- Plugin configuration.

The status line integrates CPU and memory usage, battery information, Wi-Fi status, and weather information through tmux plugins and a custom Wi-Fi script.

The configuration also integrates `sesh` and `fzf-tmux` for interactive session management.

### Yazi

A customized terminal file manager configuration with:

- Custom keybindings.
- Plugin integrations.
- Gruvbox Material and Lain flavors.
- Preview and navigation enhancements.

Plugin and flavor dependencies are declared in `yazi/package.toml`.

### Window Management

The macOS window-management setup combines:

- **yabai** for tiling layouts, window placement, and display management.
- **skhd** for keyboard-driven window navigation and management.
- **Karabiner-Elements** for keyboard remapping and custom modifier behavior.

These configurations are designed to work together as part of a keyboard-centric desktop workflow.

### Visual Consistency

Gruvbox Material is the primary visual theme across the environment.

The theme is reflected in the terminal, shell prompt, tmux status line, Neovim, Yazi, and other configured applications.

## Installation

### Prerequisites

This repository is designed around macOS. Before using the configurations, install the applications and dependencies corresponding to the tools you intend to use.

Some notable dependencies include:

- Git
- Zsh and Oh My Zsh
- Oh My Posh
- WezTerm
- tmux and tmux Plugin Manager (TPM)
- Neovim
- Yazi
- fzf
- zoxide
- Atuin
- sesh
- yabai
- skhd
- Karabiner-Elements

Individual configurations may require additional tools or application-specific dependencies.

### Clone the Repository

```bash
git clone <repository-url>
cd dotfiles
```

### Create Symbolic Links

The configurations are organized so that they can be linked into their expected locations.

First, create the configuration directory:

```bash
mkdir -p ~/.config
```

Link the Zsh configuration:

```bash
ln -s "$PWD/dotfiles/home/.zshrc" "$HOME/.zshrc"
```

Link the application configurations:

```bash
for config in "$PWD"/dotfiles/config/*; do
    [ -d "$config" ] || continue

    name="${config##*/}"
    ln -s "$config" "$HOME/.config/$name"
done
```

**Important:** Back up or move any existing configuration files before creating these links. The commands above assume that the corresponding destination paths do not already exist.

### Initialize Plugins

Some applications manage their plugins independently.

- **Neovim:** Open Neovim and allow Lazy.nvim to install the configured plugins.
- **tmux:** Use TPM to install the plugins declared in `plugins.conf`.
- **Yazi:** Install the dependencies declared in `package.toml` using Yazi's package management commands.

Restart the relevant applications after installation.

## Notes

- The repository is intended to document and share my personal environment.
- Local configuration and runtime-generated files are excluded from version control where appropriate.
- Some settings reference macOS-specific applications, paths, and system utilities.
- Individual application configurations may need adjustments depending on the installed software and hardware.
- Review application-specific documentation before enabling configurations that require additional system permissions.
