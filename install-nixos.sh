#!/usr/bin/env bash

# This file installs my git templates on this machine.

help() {
    echo 'Usage: ./install-nixos.sh'
    echo
    echo 'Installs my git templates globally by creating symbolic links in $HOME.'
    echo 'Expects the git configuration to already point to the right places.'
    echo
}

if [[ "$1" == '--help' ]]; then
    help
    exit 0
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if (( $# == 0 )); then
    ln -sfn "$DIR/links" "$HOME/.git-templates"
    ln -sfn "$DIR/templates" "$DIR/links/templateDir"
else
    help >&2
    exit 1
fi
