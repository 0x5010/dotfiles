#!/usr/bin/env bash

set -eu
set -o pipefail

DOTFILESDIRECTORY=$(pwd)

print_header() {
    printf "\e[34m"
    echo '--------------------------------------------------------------------------------'
    echo '                                                                                '
    echo '          ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗         '
    echo '          ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝         '
    echo '          ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗         '
    echo '          ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║         '
    echo '          ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║         '
    echo '          ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝         '
    echo '                                                                                '
    echo '                      https://github.com/0x5010/dotfiles                        '
    echo '                                                                                '
    echo '--------------------------------------------------------------------------------'
    printf "\e[0m\n"
}

check_os() {
    if [ "$(uname -s)" != "Darwin" ]; then
        echo "Sorry, this script is intended only for OS X"
        exit 1
    fi
}

function backup() {
    local source=$1
    backupdir="$DOTFILESDIRECTORY/backup"
    if [ -f $source ]; then
        if [ -L $source ]; then
            rm $source
        else
            echo "backup $source to $backupdir"
            mv -f $source $backupdir
        fi
    fi
}

backup_dotfiles() {
    backup ~/.zshrc
    backup ~/.vimrc
    backup ~/.vimrc.local
    backup ~/.vimrc.bundles
    backup ~/.vimrc.bundles.local
    backup ~/.gitconfig
    backup ~/.gitignore_global
    backup ~/.pip/pip.conf
    backup ~/.SpaceVim.d/init.toml
    
    echo "backup done"
}

update_dotfiles() {
    ln -s "$DOTFILESDIRECTORY/zsh/zshrc" ~/.zshrc
    ln -s "$DOTFILESDIRECTORY/vim/vimrc" ~/.vimrc
    ln -s "$DOTFILESDIRECTORY/vim/vimrc.local" ~/.vimrc.local
    ln -s "$DOTFILESDIRECTORY/vim/vimrc.bundles" ~/.vimrc.bundles
    ln -s "$DOTFILESDIRECTORY/vim/vimrc.bundles.local" ~/.vimrc.bundles.local
    ln -s "$DOTFILESDIRECTORY/spacevim/init.toml" ~/.SpaceVim.d/init.toml
    ln -s "$DOTFILESDIRECTORY/git/gitconfig" ~/.gitconfig
    ln -s "$DOTFILESDIRECTORY/git/gitignore_global" ~/.gitignore_global
    if [ ! -d ~/.pip ]; then
        mkdir ~/.pip
    fi
    ln -s "$DOTFILESDIRECTORY/python/pip.conf" ~/.pip/pip.conf


    echo "update done"
}

main() {
    print_header
    check_os
    backup_dotfiles
    update_dotfiles
}

main
