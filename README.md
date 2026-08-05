As of 2026-07-14, I use [WezTerm](https://wezterm.org/), [LazyVim](https://www.lazyvim.org/), and [tmux](https://github.com/tmux/tmux/wiki).

## Layout

- `config/nvim/` — LazyVim config, symlinked to `~/.config/nvim`
- `.zshrc`, `.tmux.conf`, `.wezterm.lua` — copies, not yet symlinked

## Install

```sh
git clone https://github.com/achao-io/.dotfiles ~/.dotfiles
~/.dotfiles/install.sh
```

`install.sh` only manages `config/nvim` so far. It backs up anything already at the
destination to `*.bak.$$` and is safe to re-run.
