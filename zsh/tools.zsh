export PIPX_HOME="$HOME/.local/pipx"
export PIPX_BIN_DIR="$HOME/.local/bin"

# node (fnm replaced nvm)
command -v fnm >/dev/null && eval "$(fnm env --use-on-cd)"

# fzf: fuzzy finder — Ctrl-R (history), Ctrl-T (file paths), Alt-C (cd)
command -v fzf >/dev/null && source <(fzf --zsh)

# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# envman (generated — do not edit)
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Load SSH keys from macOS keychain (silent)
/usr/bin/ssh-add --apple-load-keychain >/dev/null 2>&1
