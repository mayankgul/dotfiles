PROMPT="${PROMPT}"$'\n'

for file in \
    ~/.config/zsh/path.zsh \
    ~/.config/zsh/environment.zsh \
    ~/.config/zsh/plugins.zsh \
    ~/.config/zsh/completion.zsh \
    ~/.config/zsh/history.zsh \
    ~/.config/zsh/fzf.zsh \
    ~/.config/zsh/tools.zsh \
    ~/.config/zsh/alias.zsh \
    ~/.config/zsh/yazi.zsh \
    ~/.config/zsh/vi-mode.zsh \
    ~/.config/zsh/prompt.zsh
do
    [[ -f "$file" ]] && source "$file"
done

# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"

if command -v fastfetch >/dev/null 2>&1; then
  fastfetch
  echo ""
fi
