#!/bin/bash
sudo apt-get install -y build-essential libncurses-dev clang-format-10 zsh curl libpython3

# tmux minimal
bash -c "$(curl -s https://raw.githubusercontent.com/umayr/tmux/master/init.sh)"

# oh-my-zsh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
