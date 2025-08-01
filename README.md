# Mass Git

[![Project Tracker](https://img.shields.io/badge/repo%20status-Project%20Tracker-lightgrey)](https://hthompson.dev/project-tracker#project-354401798)
[![Platform](https://img.shields.io/badge/platform-Linux%20|%20macOS-lightgrey)](#supported-operating-systems)
[![Style Guide](https://img.shields.io/badge/code%20style-Style%20Guide-blueviolet)](https://bsg.hthompson.dev/)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/494a52222d904c0cb37366e598eaf8a3)](https://www.codacy.com/gh/StrangeRanger/mass-git/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=StrangeRanger/mass-git&amp;utm_campaign=Badge_Grade)

Fetch or pull one or more git repositories at a specified location on your system.

<details>
<summary><strong>Table of Contents</strong></summary>

- [Mass Git](#mass-git)
  - [Features](#features)
  - [Demo](#demo)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Download and Setup](#download-and-setup)
      - [1. Quick Start (Run Directly)](#1-quick-start-run-directly)
      - [2. Install Globally (Recommended)](#2-install-globally-recommended)
  - [Uninstallation](#uninstallation)
  - [Usage](#usage)
  - [Troubleshooting / FAQ](#troubleshooting--faq)
  - [Supported Operating Systems](#supported-operating-systems)
  - [Support](#support)
  - [License](#license)

</details>


## Features

- Recursively locate and update multiple git repositories in a directory
- Choose between `git pull` and `git fetch` for updates
- Dry-run mode to preview actions without making changes
- Simple CLI interface with helpful flags
- Works on Linux and macOS (and most Unix-like systems)

## Demo

[![asciicast](https://asciinema.hthompson.dev/a/4.svg)](https://asciinema.hthompson.dev/a/4)

*Demo: Quickly update all git repositories in a directory tree with a single command. The video shows recursive search, dry-run, and pull options in action.*

## Getting Started

### Prerequisites

- Bash (v4+ recommended)
- Git (v2+ recommended)
- Unix-like OS (Linux, macOS, BSD, WSL, etc.)

### Download and Setup

You can run Mass Git immediately in your current directory or install it globally for convenience:

#### 1. Quick Start (Run Directly)

Download and run the script in your current directory:

```bash
curl -O https://raw.githubusercontent.com/StrangeRanger/mass-git/refs/heads/main/mass-git
chmod +x mass-git
./mass-git
```

#### 2. Install Globally (Recommended)

To use Mass Git from anywhere, install it to your local bin directory:

```bash
git clone https://github.com/StrangeRanger/mass-git
cd mass-git
./setup.bash
```

After installation, you can run `mass-git` from any directory.

> [!NOTE]
> By default, `setup.bash` creates a hard link in `~/.local/bin`. To use a symbolic link instead, set `C_USE_HARD_LINK=false` in the script.

## Uninstallation

To remove the script, simply delete the `mass-git` file from your system. If you used `setup.bash`, remove the link from `~/.local/bin`:

```bash
rm ~/.local/bin/mass-git
```

If you cloned the repository, you can also delete the `mass-git` directory:

```bash
rm -rf <path_to_mass_git_directory>
```

## Usage

```man
❯ mass-git -h
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

## Troubleshooting / FAQ

<details>
<summary><strong>Q: I get a 'Permission denied' error when running the script.</strong></summary>

A: Make sure the script is executable: <code>chmod +x mass-git</code>.

</details>

<details>
<summary><strong>Q: The script is not found after running setup.</strong></summary>

A: Ensure <code>~/.local/bin</code> is in your <code>$PATH</code>. You can add it to your shell profile:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

</details>

<details>
<summary><strong>Q: Does this work on Windows?</strong></summary>

A: Not natively, but it should work in WSL or other Unix-like environments.

</details>

## Supported Operating Systems

This program should work on all Unix and Unix-like operating systems that have bash installed, including:

- Linux
- macOS
- BSD variants
- Windows Subsystem for Linux (WSL)

## Support

For questions, suggestions, or bug reports, please open an issue on [GitHub](https://github.com/StrangeRanger/mass-git/issues).

## License

This project is licensed under the [MIT License](LICENSE).
