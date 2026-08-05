#!/usr/bin/env bash
# Symlinks configs from this repo into place. Safe to re-run.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$REPO/$1" dest="$2"
  if [ ! -e "$src" ]; then
    echo "missing  $src" >&2
    return 1
  fi
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok       $dest"
    return
  fi
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "$dest.bak.$$"
    echo "backup   $dest -> $dest.bak.$$"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "linked   $dest"
}

link config/nvim "$HOME/.config/nvim"
link config/zsh/zshrc "$HOME/.zshrc"
link config/wezterm/wezterm.lua "$HOME/.config/wezterm/wezterm.lua"
# File-level, not the directory: ~/.config/tmux/plugins is TPM-managed.
link config/tmux/tmux.conf "$HOME/.config/tmux/tmux.conf"
