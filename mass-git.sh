#!/bin/bash
#
# Performs a git pull on all git repositories located in a specific directory on
# a system.
#
################################################################################
#### [ Variables ]

green=$'\033[0;32m'
blue=$'\033[0;34m'
red=$'\033[1;31m'
nc=$'\033[0m'

version="v1.0.0"
root_dir="$PWD"
recursive=false
provided_path=false
git_repos=()


#### End of [ Variables ]
################################################################################
#### [ Functions ]


usage() {
    echo "Performs a git pull on all git repositories located in a specific directory on a system."
    echo "Usage: ./$(basename $0) [-hrv] -p <path to dir>"
    echo ""
    echo "Options:"
    echo "    -h, --help        : Displays this help message."
    echo "    -p, --path        : Allows you to provide the path to which the script will run in."
    echo "    -r, --recursive   : Recursivly run the program."
    echo "    -v, --version     : Display version number."
}


#### End of [ Functions ]
################################################################################
#### [ Options ]


if [[ $# -eq 0 ]]; then
    usage
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
            recursive=true
            ;;
        "-v"|"--version")
            echo "Version: $version"
            exit 0
            ;;
        *)
            echo "${red}Invalid option: -$OPTARG${nc}" >&2
            echo ""
            usage
            exit 1
            ;;
    esac

    shift
done

# Checks if provided path is a valid directory
if [[ $provided_path = true ]]; then
    if [[ ! -d $path ]]; then
        if [[ -f $path ]]; then
            echo "${red}Invalid input:${nc} You input a file" >&2
        else
            echo "${red}Invalid input:${nc} Directory does not exist" >&2
        fi
        exit 1
    fi
else
    echo "${red}Invalid input:${nc} Missing argument '-p <path of dir>'"
fi


#### End of [ Options ]
################################################################################
#### [ Main ]


if [[ $recursive = true ]]; then
    while read -r -d $'\0'; do
        git_repos+=(${REPLY/%.git/})
        sleep 1
    done < <(find "$path" -type d -name ".git" -prune -print0)

    # Uncomment to help debug...
    #for repo_path in "${git_repos[@]}"; do
    #    echo "$repo_path"
    #done

    if [[ -z $git_repos ]]; then
        echo "${red}ERROR:${nc} No git initialized directory could be found"
        exit 1
    fi
else
    if [[ ! $(find "$path" -maxdepth 1 -type d -name ".git" -prune) ]]; then
        echo "${red}ERROR:${nc} No git initialized directory could be found"
        exit 1
    fi
fi

for repo_path in "${git_repos[@]}"; do
    echo "${blue}==>${nc} Changing directories to '$repo_path'..."
    cd "$repo_path" || {
        echo "${red}ERROR:${nc} Failed to change directories"
        exit 1
    }
    repo_name="$(git config --get remote.origin.url)"

    echo "${blue}==>${nc} Pulling from '$repo_name'..."
    git pull || echo "${red}ERROR:${nc} Failed to pull from '$repo_name'"

    echo "${blue}==>${nc} Returning to '$root_dir'..."
    cd "$root_dir" || {
        echo "${red}ERROR:${nc} Failed to change directories"
        exit 1
    }
done

echo "${green}==>${nc} Done"


#### End of [ Main ]
################################################################################
