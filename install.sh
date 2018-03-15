#!/bin/bash

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

backup_dotfiles() {
    backupdir="$DOTFILESDIRECTORY/backup"
    mv ~/.zshrc $backupdir
    mv ~/.vimrc $backupdir
    mv ~/.vimrc.local $backupdir
    mv ~/.vimrc.bundles $backupdir
    mv ~/.vimrc.bundles.local $backupdir
    mv ~/.gitconfig $backupdir
    mv ~/.gitignore_global $backupdir
    
    echo "backup done"
}

update_dotfiles() {
    ln -s "$DOTFILESDIRECTORY/zsh/zshrc" ~/.zshrc
    ln -s "$DOTFILESDIRECTORY/vim/vimrc" ~/.vimrc
    ln -s "$DOTFILESDIRECTORY/vim/vimrc.local" ~/.vimrc.local
    ln -s "$DOTFILESDIRECTORY/vim/vimrc.bundles" ~/.vimrc.bundles
    ln -s "$DOTFILESDIRECTORY/vim/vimrc.bundles.local" ~/.vimrc.bundles.local
    ln -s "$DOTFILESDIRECTORY/git/gitconfig" ~/.gitconfig
    ln -s "$DOTFILESDIRECTORY/git/gitignore_global" ~/.gitignore_global

    echo "update done"
}

main() {
    print_header
    check_os
    backup_dotfiles
    update_dotfiles
}

main
