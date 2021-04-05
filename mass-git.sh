#!/bin/bash
################################################################################
#### [ Variables ]


green=$'\033[0;32m'
blue=$'\033[0;34m'
red=$'\033[1;31m'
nc=$'\033[0m'

version="v1.0.0-beta"   # Program version.
root_dir="$PWD"         # Directory the program was executed from.
maxdepth="-maxdepth 2"  # Peform recursive searches with a maximum depth of 2.
provided_path=false     # Validates that a path was provided.
git_repos=()            # List of paths to existing repositories on the system.


#### End of [ Variables ]
################################################################################
#### [ Functions ]


usage() {
    echo "Usage: ./$(basename $0) [-r] -p <path>"
    echo "       ./$(basename $0) -h"
    echo "       ./$(basename $0) -v"
    echo ""
    echo "Options:"
    echo "  -h, --help       : Displays this help message."
    echo "  -p, --path       : Path to perfrom mass git pull/fetch on."
    echo "  -r, --recursive  : Recursivly run the program."
    echo "  -v, --version    : Display program version number."
}


#### End of [ Functions ]
################################################################################
#### [ Options ]


if [[ $# -eq 0 ]]; then
    usage
    exit 0
fi

while [[ ! -z $1 ]]; do
    case "$1" in
        "-h"|"--help")
            usage
            exit 0
            ;;
        "-p"|"--path")
            shift
            path="$1"
            provided_path=true
            ;;
        "-r"|"--recursive")
            # Remove the maxium depth of recursion.
            unset maxdepth
            ;;
        "-v"|"--version")
            echo "Mass Git $version"
            exit 0
            ;;
        *)
            echo "${red}Invalid option:$nc $1" >&2
            echo ""
            usage
            exit 1
            ;;
    esac

    shift
done

# Checks if provided path is a valid directory.
if [[ $provided_path = true ]]; then
    if [[ ! -d $path ]]; then
        if [[ -f $path ]]; then
            echo "${red}Invalid input:$nc File was provided when a directory" \
                "was expected" >&2
        else
            echo "${red}Invalid input:$nc Directory does not exist" >&2
        fi
        exit 1
    fi
else
    echo "${red}Invalid input:$nc Missing required argument '-p <path>'"
    exit 1
fi


#### End of [ Options ]
################################################################################
#### [ Main ]


# Store the location of all local repositories found.
while read -r -d $'\0'; do
    git_repos+=(${REPLY/%.git/})
done < <(find "$path" $maxdepth -type d -name ".git" -prune -print0)

# If no local repositories were found.
if [[ -z $git_repos ]]; then
    echo "${red}ERROR:$nc No git initialized directory could be found"
    exit 1
fi

for repo_path in "${git_repos[@]}"; do
    echo "${blue}==>$nc Changing directories to '$root_dir/$repo_path'..."
    cd "$root_dir"/"$repo_path" || {
        echo "${red}ERROR:$nc Failed to change directories"
        exit 1
    }
    repo_name="$(git config --get remote.origin.url)"

    echo "${blue}==>${nc} Pulling from '$repo_name'..."
    git pull || echo "${red}ERROR:$nc Failed to pull from '$repo_name'"
done

echo "${green}==>$nc Done"


#### End of [ Main ]
################################################################################
