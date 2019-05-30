#!/bin/bash

# This file installs my git templates on this machine.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo 'In order to install git templates on this machine,'
echo 'we are going to run the following commands:'
echo
echo "ln -sf '$DIR/links' \"\$HOME/.git-templates\""
echo "ln -sf '$DIR/templates' '$DIR/links/templateDir'"
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

ln -sf "$DIR/links" "$HOME/.git-templates"
ln -sf "$DIR/templates" "$DIR/links/templateDir"
git config --global init.templatedir "$HOME/.git-templates"
