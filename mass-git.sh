#!/bin/bash
########################################################################################
#### [ Variables ]


green=$'\033[0;32m'
blue=$'\033[0;34m'
red=$'\033[1;31m'
nc=$'\033[0m'

version="v1.0.0"        # Program version.
maxdepth="-maxdepth 2"  # Peform recursive searches with a maximum depth of 2.
provided_path=false     # Validates that a path was provided.
git_repos=()            # List of paths to existing repositories on the system.


#### End of [ Variables ]
########################################################################################
#### [ Functions ]


usage() {
    echo "Fetch or pull one or more git repositories at a specified location on your system."
    echo ""
    echo "Usage: ./$(basename "$0") [-r] -p <path>"
    echo "       ./$(basename "$0") -h"
    echo "       ./$(basename "$0") -v"
    echo ""
    echo "Options:"
    echo "  -h, --help       : Displays this help message."
    echo "  -p, --path       : Path to perform mass git pull/fetch on."
    echo "  -r, --recursive  : Recursively locate git repositories."
    echo "  -v, --version    : Display program version number."
}


#### End of [ Functions ]
########################################################################################
#### [ Options ]


# If no arguments are provided...
if [[ $# -eq 0 ]]; then
    usage
    exit 0
fi

# While there are still arguments to traverse...
while [[ -n $1 ]]; do
    case "$1" in
        "-h"|"--help")
            usage
            exit 0
            ;;
        "-p"|"--path")
            shift
            if hash realpath; then path="$(realpath "$1")"
            else
                ####
                # EXPLANATION:
                #   1. Gets the relative path as argument `"$1"`
                #   2. Gets the dirname part of that path: `dirname "$1"`
                #   3. `cd "$(dirname "$1")` into the relative dir and get the absolute
                #      path for it by running `pwd`
                #   4. Append the basename to the absolute path: `$(basename "$1")`
                #
                # This solution was found at the following link:
                # https://stackoverflow.com/questions/4175264/how-to-retrieve-absolute-path-given-relative/31605674#31605674
                #
                # '|| exit' makes sure that if the script is unable to change
                # directories, the script is exitted.
                ####
                path="$(cd "$(dirname "$1")" || exit; pwd)/$(basename "$1")"
            fi
            provided_path=true
            ;;
        "-r"|"--recursive")
            unset maxdepth  # Remove the maxium depth of recursion.
            ;;
        "-v"|"--version")
            echo "Mass Git $version"
            exit 0
            ;;
        *)
            echo "${red}Invalid option:$nc $1" >&2
            exit 1
            ;;
    esac
    shift
done

## Check if the provided path is a valid directory.
if [[ $provided_path = true ]]; then
    if [[ ! -d $path ]]; then
        if [[ -f $path ]]; then
            echo "${red}Invalid input:$nc File was provided when a directory was" \
                "expected" >&2
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
########################################################################################
#### [ Main ]


## Store the location of all local repositories found.
## NOTE: $maxdepth is purposefully unquoted. Do not quote it!
while read -r -d $'\0'; do
    git_repos+=("${REPLY/%.git/}")
done < <(find "$path" $maxdepth -type d -name ".git" -prune -print0)

# If no local repositories were found...
# NOTE: Leave $git_repos as is. It's fine that only the first index of the array is
#       provided, as all we are trying to do is confirm whether or not a git initialized
#       directory was located.
if [[ -z $git_repos ]]; then
    echo "${red}ERROR:$nc No git initialized directory could be found"
    exit 1
fi

for repo_path in "${git_repos[@]}"; do
    echo "${blue}==>$nc Changing directories to '$repo_path'..."
    cd "$repo_path" || {
        echo "${red}ERROR:$nc Failed to change directories"
        exit 1
    }
    repo_name="$(git config --get remote.origin.url)"

    echo "${blue}==>${nc} Pulling from '$repo_name'..."
    git pull || echo "${red}ERROR:$nc Failed to pull from '$repo_name'"
done

echo "${green}==>$nc Done"


#### End of [ Main ]
########################################################################################
