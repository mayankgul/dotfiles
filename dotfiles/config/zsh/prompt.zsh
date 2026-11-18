eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/bubblesline.omp.json)"

export OMP_VI_MODE="INS"

function _omp_update_vi_mode() {
  if zle; then
    eval "$(_omp_get_prompt primary --eval)"
    zle .reset-prompt
  fi
}

# If you use jeffreytse/zsh-vi-mode:
function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL) export OMP_VI_MODE="NOR" ;;
    $ZVM_MODE_INSERT) export OMP_VI_MODE="INS" ;;
    $ZVM_MODE_VISUAL|$ZVM_MODE_VISUAL_LINE) export OMP_VI_MODE="VIS" ;;
    $ZVM_MODE_REPLACE) export OMP_VI_MODE="REP" ;;
  esac
  _omp_update_vi_mode
}

function zvm_after_init() {
  export OMP_VI_MODE="INS"
}

function set_poshcontext() {
  local wifi_ssid=$(networksetup -listpreferredwirelessnetworks en0 | sed -n '2s/^\t//p')
  export OMP_WIFI_SSID="$wifi_ssid"
}

# Prompt Style (Gruvbox Material)

export PLS_ERROR_LINE_STYLE="#EA6962"
export PLS_ERROR_TEXT_STYLE="#EA6962 bold"

export PLS_WARNING_LINE_STYLE="#D8A657"
export PLS_WARNING_TEXT_STYLE="#D8A657 bold"

export PLS_UPDATE_LINE_STYLE="#A9B665"
export PLS_UPDATE_TEXT_STYLE="#A9B665 bold"

export PLS_INSERT_DELETE_LINE_STYLE="#D3869B"
export PLS_INSERT_DELETE_TEXT_STYLE="#D3869B"

export PLS_MSG_PENDING_STYLE="#7C6F64"
export PLS_TABLE_HEADER_STYLE="#E78A4E"
export PLS_TASK_DONE_STYLE="#7C6F64"
export PLS_TASK_PENDING_STYLE="#D3869B"

export PLS_HEADER_GREETINGS_STYLE="#E78A4E"
export PLS_QUOTE_STYLE="#7C6F64"
export PLS_AUTHOR_STYLE="#7C6F64"

export PLS_BACKGROUND_BAR_STYLE="bar.back"
export PLS_COMPLETE_BAR_STYLE="bar.complete"
export PLS_FINISHED_BAR_STYLE="bar.finished"
