#!/usr/bin/env zsh
set -x

sudo apt install build-essential

#######################
# ZSH
#######################
# Fast syntax highlighting
if [[ ! -d $HOME/.zsh/fast-syntax-highlighting ]]; then
    git clone https://github.com/zdharma/fast-syntax-highlighting.git $HOME/.zsh/fast-syntax-highlighting
fi

#######################
# TMUX
#######################

if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
    mkdir -p $HOME/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi


#######################
# BIN
#######################

mkdir -p $HOME/bin

# FASD
if [[ ! -f $HOME/bin/fasd ]]; then
    git clone https://github.com/clvv/fasd.git /tmp/fasd
    cd /tmp/fasd
    PREFIX=$HOME make install
    cd -
fi

# FZF
if [[ ! -f $HOME/.fzf/bin/fzf ]]; then
    git clone https://github.com/junegunn/fzf.git $HOME/.fzf
    yes | $HOME/.fzf/install
fi

# DIFF-SO-FANCY
if [[ ! -f $HOME/bin/diff-so-fancy ]]; then
    curl -o $HOME/bin/diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
fi

