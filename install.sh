#!/bin/bash

# This file installs my git templates on this machine.

help() {
    echo 'Usage: ./install.sh [repos...]'
    echo
    echo 'If you provide no arguments, my git templates will be installed globally.'
    echo 'This will have no effect on existing git repos on the disk.'
    echo
    echo 'If you provide a list of paths as arguments, rather than installing my git'
    echo 'templates globally, they will only be installed in the specified repos.'
    echo
}

if [[ "$1" == '--help' ]]; then
    help
    exit 0
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if (( $# == 0 )); then
    echo 'In order to install git templates on this machine,'
    echo 'we are going to run the following commands:'
    echo
    echo "ln -sfn '$DIR/links' \"\$HOME/.git-templates\""
    echo "ln -sfn '$DIR/templates' '$DIR/links/templateDir'"
    echo "git config --global init.templatedir \"\$HOME/.git-templates\""
    echo
    echo 'After this, if you move this repository you will have to reinstall.'
    echo

    while true; do
        read -p 'Are you sure you want to continue (Y/n)? ' yn
        case ${yn:0:1} in
            y|Y )
                break
                ;;
            n|N )
                exit
                ;;
            * )
                echo 'Your response was not understood.'
                echo
                ;;
        esac
    done

    ln -sfn "$DIR/links" "$HOME/.git-templates"
    ln -sfn "$DIR/templates" "$DIR/links/templateDir"
    git config --global init.templatedir "$HOME/.git-templates"
else
    for repo in "$@"; do
        if [[ -d "$repo/.git" ]]; then
            echo "Installing into $repo"
            if ! cp -Pr "$DIR/links/." "$repo/.git"; then
                echo "Failed to install into $repo! D:"
            fi
        else
            echo "$repo is not a git repository!"
        fi
    done
fi
