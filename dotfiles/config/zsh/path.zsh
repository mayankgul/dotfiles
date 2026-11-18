export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export PATH="/opt/homebrew/bin:$PATH"
export PATH=~/.console-ninja/.bin:$PATH

export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/usr/local/mysql/bin"

export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin

export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$(go env GOPATH)/bin"

# The next line updates PATH for the Google Cloud SDK.
if [[ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]]; then
    source "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"
fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
