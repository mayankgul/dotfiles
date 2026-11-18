# fzf-tab
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always --color=always $realpath'

zstyle ':fzf-tab:complete:*' fzf-preview '
if [[ -d $realpath ]]; then
  eza --icons=always --color=always $realpath
else
  bat --color=always --style=numbers --line-range=:300 $realpath
fi'

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' squeeze-slashes true

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

zstyle ':completion:*' list-prompt '%SScrolling...%s'

# The next line enables shell command completion for gcloud.
if [[ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]]; then
    source "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"
fi

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
