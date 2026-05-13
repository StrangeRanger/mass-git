#!/usr/bin/env bash
#
# Create a symbolic or hard link to the 'mass-git' script in the '~/.local/bin/'
# directory. This will allow the script to be executed anywhere in the terminal.
#
# Version: v1.0.2
# License: MIT License
#          Copyright (c) 2021-2026 Hunter T. (StrangeRanger)
#
########################################################################################
set -euo pipefail
####[ Global Variables ]################################################################


###
### [ Configurable Constants ]
###

readonly C_USE_HARD_LINK=true  # Use hard link instead of symlink to 'mass-git' script.

###
### [ Non-configurable Constants ]
###

C_GREEN=$'\033[0;32m'
C_BLUE=$'\033[0;34m'
C_CYAN=$'\033[0;36m'
C_RED=$'\033[1;31m'
C_YELLOW=$'\033[1;33m'
C_NC=$'\033[0m'
readonly C_GREEN C_BLUE C_CYAN C_RED C_YELLOW C_NC

readonly C_SUCC="${C_GREEN}==>${C_NC} "
readonly C_ERROR="${C_RED}ERROR:${C_NC} "
readonly C_INFO="${C_BLUE}==>${C_NC} "
readonly C_NOTE="${C_CYAN}==>${C_NC} "
readonly C_WARN="${C_YELLOW}WARNING:${C_NC} "

# Path to the '~/.local/bin/' directory.
readonly C_LOCAL_BIN="$HOME/.local/bin"

# Directory containing this setup script.
C_SCRIPT_DIR="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly C_SCRIPT_DIR


####[ Functions ]#######################################################################


####
# Check if the '~/.local/bin/' directory is in the 'PATH' environment variable.
#
# PARAMETERS:
#   - $1: path_to_check (Required)
#
# RETURNS:
#   - 0: If the '~/.local/bin/' directory is in the 'PATH'.
#   - 1: If the '~/.local/bin/' directory is NOT in the 'PATH'.
check_path() {
    local path_to_check="$1"

    echo "${C_INFO}Checking if '$path_to_check' is in your 'PATH'..."
    if [[ ":$PATH:" == *":$path_to_check:"* ]]; then
        return 0
    else
        return 1
    fi
}

####
# Remove the existing symlink or hard link to the 'mass-git' script in the
# '~/.local/bin/' directory.
#
# # PARAMETERS:
#   - $1: path_to_check (Required)
remove_link() {
    local link="$1"

    if [[ -L "$link/mass-git" ]]; then
        echo "${C_INFO}Removing existing symlink to 'mass-git' in '$link'..."
        rm -f "$link/mass-git"
    elif [[ -e "$link/mass-git" ]]; then
        echo "${C_INFO}Removing existing hard link to 'mass-git' in '$link'..."
        rm -f "$link/mass-git"
    fi
}


####[ Main ]#############################################################################


if [[ ! -d "$C_LOCAL_BIN/" ]]; then
    echo "${C_INFO}Creating '$C_LOCAL_BIN' directory..."
    mkdir -p "$C_LOCAL_BIN/" || {
        echo "${C_ERROR}Failed to create '$C_LOCAL_BIN' directory."
        exit 1
    }
fi

if [[ $C_USE_HARD_LINK == false ]]; then
    remove_link "$C_LOCAL_BIN"
    echo "${C_INFO}Creating symlink to 'mass-git' in '$C_LOCAL_BIN'..."
    ln -s "$C_SCRIPT_DIR/mass-git" "$C_LOCAL_BIN/mass-git" || {
        echo "${C_ERROR}Failed to create symlink to 'mass-git' in '$C_LOCAL_BIN'."
        exit 1
    }
else
    remove_link "$C_LOCAL_BIN"
    echo "${C_INFO}Creating hard link to 'mass-git' in '$C_LOCAL_BIN'..."
    ln "$C_SCRIPT_DIR/mass-git" "$C_LOCAL_BIN/mass-git" || {
        echo "${C_ERROR}Failed to create hard link to 'mass-git' in '$C_LOCAL_BIN'."
        exit 1
    }
fi

if check_path "$C_LOCAL_BIN"; then
    echo "${C_NOTE}Path to '$C_LOCAL_BIN' already exists in your 'PATH'"
else
    echo "${C_WARN}It appears that '$C_LOCAL_BIN' is not in your 'PATH'"
    echo "${C_NOTE}Please add the following to your 'PATH':"
    echo "${C_NOTE}  \$HOME/.local/bin"
fi

echo "${C_SUCC}Done"
