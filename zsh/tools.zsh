export PATH="$HOME/.local/bin:$PATH"

# fzf: fuzzy finder — Ctrl-R (history), Ctrl-T (file paths), Alt-C (cd)
command -v fzf >/dev/null && source <(fzf --zsh)

# Load SSH keys from macOS keychain (silent)
/usr/bin/ssh-add --apple-load-keychain >/dev/null 2>&1
