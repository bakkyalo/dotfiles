# dotfiles

My dotfiles

## Requirement

- [dein.vim](https://github.com/Shougo/dein.vim)

## Installation

Before installation, make a backup of your dotfiles.

- .tmux.conf
- .vimrc
- .vim/dein.toml

```sh
git clone https://github.com/bakkyalo/dotfiles
cd dotfiles
```

Here is an example for `.vimrc`

```sh
ln -sf "$(pwd)/.vimrc" "$HOME/.vimrc"
```

(todo) Automate this process
