# Mass Git

[![Project Tracker](https://img.shields.io/badge/repo%20status-Project%20Tracker-lightgrey)](https://wiki.hthompson.dev/en/project-tracker)
![Platform](https://img.shields.io/badge/platform-Linux%20|%20macOS-lightgrey)
[![Style Guide](https://img.shields.io/badge/code%20style-Style%20Guide-blueviolet)](https://bsg.hthompson.dev/)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/494a52222d904c0cb37366e598eaf8a3)](https://www.codacy.com/gh/StrangeRanger/mass-git/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=StrangeRanger/mass-git&amp;utm_campaign=Badge_Grade)

Fetch or pull one or more git repositories at a specified location on your system.

## Getting Started

### Download and Setup

If you want to use the script as is, you can download the script and run it directly:

```bash
git clone https://github.com/StrangeRanger/mass-git
cd mass-git
./mass-git
```

If you want the script accessible outside of the directory you downloaded it to, you can run the setup script. It will place a symbolic or hard link (configurable via the script) in your local bin directory (`~/.local/bin`).

```bash
git clone https://github.com/StrangeRanger/mass-git
cd mass-git
./setup.bash
```

## Usage

```man
❯ ./mass-git -h
Fetch or pull one or more git repositories at a specified location on your
system.

Usage: mass-git [-r] [-f] [-d] <path>
       mass-git -h
       mass-git -v

Options:
  -h, --help      : Displays this help message.
  -r, --recursive : Recursively locate git repositories.
  -f, --fetch     : Fetch instead of pull from git repository.
  -d, --dry-run   : Show what would be done, without making any changes.
  -v, --version   : Display program version number.
```

Here is an example output:

```txt
❯ ./mass-git.sh -r ~/Programs/tmp
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

## Supported Operating Systems

This program should work on all unix and unix-like operating systems that have bash installed.
