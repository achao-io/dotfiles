#!/usr/bin/env bash
# Symlinks configs from this repo into place. Safe to re-run.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$REPO/$1" dest="$2"
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok       $dest"
    return
  fi
  if [ -e "$dest" ]; then
    mv "$dest" "$dest.bak.$$"
    echo "backup   $dest -> $dest.bak.$$"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "linked   $dest"
}

link config/nvim "$HOME/.config/nvim"
