#!/usr/bin/env bash
#
#
#
########################################################################################

use_hard_links=false
pattern="^export PATH=.*(/.local/bin).*"

if [[ ! -d "$HOME/.local/bin/" ]]; then
    echo "Creating '~/.local/bin/' directory..."
    mkdir -p "$HOME/.local/bin/"
fi

if [[ $use_hard_links == false ]]; then
    echo "Creating symlink to 'mass-git' in '~/.local/bin/'..."
    ln -s "${0%/*}/mass-git" "$HOME/.local/bin/mass-git"
else
    echo "Creating hard link to 'mass-git' in '~/.local/bin/'..."
    ln "${0%/*}/mass-git" "$HOME/.local/bin/mass-git"
fi
