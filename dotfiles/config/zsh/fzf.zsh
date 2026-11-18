# ------------------------------------------------------------
# FZF (Gruvbox Material)
# ------------------------------------------------------------

export FZF_DEFAULT_OPTS='
  --layout=reverse
  --height=80%
  --border=rounded
  --info=inline-right
  --prompt="󰱼 "
  --pointer="▶"
  --marker="▌"
  --separator="─"
  --scrollbar="│"
  --color=bg:#282828
  --color=bg+:#32302F
  --color=fg:#D4BE98
  --color=fg+:#DDC7A1
  --color=hl:#A9B665
  --color=hl+:#89B482
  --color=border:#45403D
  --color=prompt:#7DAEA3
  --color=pointer:#D8A657
  --color=marker:#D3869B
  --color=spinner:#E78A4E
  --color=header:#7C6F64
  --color=info:#7C6F64
'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
