# ------------------------------------------
# Zsh Vi Mode
# ------------------------------------------

# Use Neovim when editing the current command
export EDITOR="nvim"
export VISUAL="nvim"

# Start every new command line in Insert mode
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

# Cursor styles
ZVM_CURSOR_STYLE_ENABLED=true

# Insert mode: blinking beam
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM

# Normal mode: blinking block
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

# Visual mode: block
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLOCK

# Use jk to escape from Insert mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# Enable system clipboard integration
ZVM_SYSTEM_CLIPBOARD_ENABLED=true

# Enable native surround keybindings
ZVM_VI_SURROUND_BINDKEY=classic

ZVM_INIT_MODE=sourcing

# Load the plugin
source "$(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
