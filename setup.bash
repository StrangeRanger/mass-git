#!/usr/bin/env bash
#
# Create a symbolic or hard link to the 'mass-git' script in the '~/.local/bin/'
# directory. This will allow the script to be executed anywhere in the terminal.
#
# Version: v1.0.0
# License: MIT License
#          Copyright (c) 2021-2024 Hunter T. (StrangeRanger)
#
########################################################################################
####[ Global Variables ]################################################################


###
### [ Configurable Constants ]
###

readonly C_USE_HARD_LINK=true  # Use hard link instead of symlink to 'mass-git' script.

###
### [ Non-configurable Constants ]
###

## ANSI color codes.
C_GREEN="$(printf '\033[0;32m')"
C_BLUE="$(printf '\033[0;34m')"
C_CYAN="$(printf '\033[0;36m')"
C_RED="$(printf '\033[1;31m')"
C_NC="$(printf '\033[0m')"
readonly C_GREEN C_BLUE C_CYAN C_RED C_NC

## Shorthanded variables for colorized output.
readonly C_SUCCESS="${C_GREEN}==>${C_NC} "
readonly C_ERROR="${C_RED}ERROR:${C_NC} "
readonly C_INFO="${C_BLUE}==>${C_NC} "
readonly C_NOTE="${C_CYAN}==>${C_NC} "

# Path to the '~/.local/bin/' directory.
readonly C_LOCAL_BIN="$HOME/.local/bin"


####[ Functions ]#######################################################################


check_path() {
    echo "${C_INFO}Checking if '$C_LOCAL_BIN' is in your 'PATH'..."
    if echo "$PATH" | grep -qE "$C_LOCAL_BIN"; then
        return 0
    else
        return 1
    fi
}

remove_link() {
    if [[ -L "$C_LOCAL_BIN/mass-git" ]]; then
        echo "${C_INFO}Removing existing symlink to 'mass-git' in '$C_LOCAL_BIN'..."
        rm -f "$C_LOCAL_BIN/mass-git"
    elif [[ -e "$C_LOCAL_BIN/mass-git" ]]; then
        echo "${C_INFO}Removing existing hard link to 'mass-git' in '$C_LOCAL_BIN'..."
        rm -f "$C_LOCAL_BIN/mass-git"
    fi
}


####[ Main ]#############################################################################


if [[ ! -d "$C_LOCAL_BIN/" ]]; then
    echo "${C_INFO}Creating '$C_LOCAL_BIN' directory..."
    mkdir -p "$C_LOCAL_BIN/" || {
        echo "${C_ERROR}Failed to create '$C_LOCAL_BIN' directory."
        exit 1
    }
    set_path
fi

if [[ $C_USE_HARD_LINK == false ]]; then
    remove_link
    echo "${C_INFO}Creating symlink to 'mass-git' in '$C_LOCAL_BIN'..."
    ln -s "${0%/*}/mass-git" "$C_LOCAL_BIN/mass-git" || {
        echo "${C_ERROR}Failed to create symlink to 'mass-git' in '$C_LOCAL_BIN'."
        exit 1
    }
else
    remove_link
    echo "${C_INFO}Creating hard link to 'mass-git' in '$C_LOCAL_BIN'..."
    ln "${0%/*}/mass-git" "$C_LOCAL_BIN/mass-git" || {
        echo "${C_ERROR}Failed to create hard link to 'mass-git' in '$C_LOCAL_BIN'."
        exit 1
    }
fi

if check_path; then
    echo "${C_SUCCESS}Path to '$C_LOCAL_BIN' already exists in your 'PATH'"
else
    echo "${C_WARNING}It appears that '$C_LOCAL_BIN' is not in your 'PATH'"
    echo "${C_NOTE}Please add the following to your 'PATH':"
    echo "${C_NOTE}  \$HOME/.local/bin"
fi
