# Mass Git

[![Project Tracker](https://img.shields.io/badge/repo%20status-Project%20Tracker-lightgrey)](https://randomserver.xyz/project-tracker.html#mass-git)
![Platform](https://img.shields.io/badge/platform-Linux%20|%20macOS-lightgrey)
[![Style Guide](https://img.shields.io/badge/code%20style-Style%20Guide-blueviolet)](https://github.com/StrangeRanger/bash-style-guide)

Fetch or pull one or more git repositories at a specified location on your system.

## Getting Started

### Installing

All you need to do is download the repository. There are no binaries or anything to install.

`git clone https://github.com/StrangeRanger/mass-git/`

## Usage

```bash
Usage: ./mass-git.sh [-r] -p <path>
       ./mass-git.sh -h
       ./mass-git.sh -v

Options:
  -h, --help       : Displays this help message.
  -p, --path       : Path to perform mass git pull/fetch on.
  -r, --recursive  : Recursively run the program.
  -v, --version    : Display program version number.
```

Here is some example output:

```txt
❯ ./mass-git.sh -r -p ~/Programs/tmp
==> Changing directories to '/Users/hunter/Programs/tmp/FINISH THESE/mass-git/'...
==> Pulling from 'https://github.com/StrangeRanger/mass-git.git'...
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (1/1), done.
remote: Total 3 (delta 2), reused 3 (delta 2), pack-reused 0
Unpacking objects: 100% (3/3), 1.53 KiB | 522.00 KiB/s, done.
From https://github.com/StrangeRanger/mass-git
   099e202..b50b4e2  dev        -> origin/dev
   099e202..b50b4e2  master     -> origin/master
Updating 099e202..b50b4e2
Fast-forward
 mass-git.sh | 41 +++++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)
==> Changing directories to '/Users/hunter/Programs/tmp/FINISH THESE/dynamic motd/'...
==> Pulling from 'https://github.com/StrangeRanger/dynamic-motd'...
Already up to date.
==> Changing directories to '/Users/hunter/Programs/tmp/formatters/prettier/'...
==> Pulling from 'https://gist.github.com/StrangeRanger/89a2a1c3982ed4ac392d9425463ba4e8'...
Already up to date.
==> Changing directories to '/Users/hunter/Programs/tmp/programming terminology/'...
==> Pulling from 'https://github.com/StrangeRanger/programming-terminology'...
remote: Repository not found.
fatal: repository 'https://github.com/StrangeRanger/programming-terminology/' not found
ERROR: Failed to pull from 'https://github.com/StrangeRanger/programming-terminology'
==> Changing directories to '/Users/hunter/Programs/tmp/string permutation/'...
==> Pulling from 'https://github.com/StrangeRanger/string-permutation'...
Already up to date.
==> Changing directories to '/Users/hunter/Programs/tmp/continue working on/NadekoBot-BashScript/'...
==> Pulling from 'https://github.com/StrangeRanger/NadekoBot-BashScript'...
Already up to date.
==> Done
```

## Tested On

...
