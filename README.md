# Mass Git

[![Project Tracker](https://img.shields.io/badge/repo%20status-Project%20Tracker-lightgrey)](https://hthompson.dev/project-tracker#project-354401798)
[![Platform](https://img.shields.io/badge/platform-Linux%20|%20macOS-lightgrey)](#supported-operating-systems)
[![Style Guide](https://img.shields.io/badge/code%20style-Style%20Guide-blueviolet)](https://bsg.hthompson.dev/)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/494a52222d904c0cb37366e598eaf8a3)](https://www.codacy.com/gh/StrangeRanger/mass-git/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=StrangeRanger/mass-git&amp;utm_campaign=Badge_Grade)

A simple bash script to fetch or pull one or more git repositories at a specified location on your system. Perfect for keeping multiple projects up-to-date with a single command.

<details>
<summary><strong>Table of Contents</strong></summary>

- [Mass Git](#mass-git)
  - [Demo](#demo)
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Download and Setup](#download-and-setup)
      - [1. Quick Start (Run Directly)](#1-quick-start-run-directly)
      - [2. Install Globally (Recommended)](#2-install-globally-recommended)
  - [Usage](#usage)
  - [Uninstallation](#uninstallation)
  - [Supported Operating Systems](#supported-operating-systems)
  - [Troubleshooting / FAQ](#troubleshooting--faq)
  - [Support and Issues](#support-and-issues)
  - [License](#license)

</details>

## Demo

[![asciicast](https://asciinema.hthompson.dev/a/4.svg)](https://asciinema.hthompson.dev/a/4)

## Features

- **Bulk repository management**: Automatically discover and update multiple git repositories in a directory
- **Flexible update modes**: Choose between `git pull` (merge changes) and `git fetch` (download only)
- **Smart repository detection**: Recursively find all `.git` directories with configurable depth
- **Safe preview mode**: Dry-run option to see what actions would be performed before executing
- **Robust error handling**: Continues processing other repositories even if one fails
- **Cross-platform compatibility**: Works on Linux, macOS, and other Unix-like systems
- **Zero dependencies**: Pure bash script with no external requirements beyond git

## Getting Started

### Prerequisites

- **Bash**: Version 4.0 or higher
- **Git**: Version 2.0 or higher

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

Next, verify that the script is executable and available in your PATH:

```bash
mass-git -v
# Should output something like: Mass Git v2.0.2
```

> [!NOTE]
> By default, `setup.bash` creates a hard link in `~/.local/bin`. To use a symbolic link instead, set `C_USE_HARD_LINK=false` in the script.

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

## Uninstallation

To remove the script, simply delete the `mass-git` file from your system. If you used `setup.bash`, remove the link from `~/.local/bin`:

```bash
rm ~/.local/bin/mass-git
```

If you cloned the repository, you can also delete the `mass-git` directory:

```bash
rm -rf <path_to_mass_git_directory>
```

## Supported Operating Systems

This program should work on all Unix and Unix-like operating systems that have bash installed, including:

- Linux
- macOS
- BSD variants
- Windows Subsystem for Linux (WSL)

## Troubleshooting / FAQ

<details>
<summary><strong>Q: I get a 'Permission denied' error when running the script.</strong></summary>

> **A:** Make sure the script is executable: `chmod +x mass-git`.

</details>

<details>
<summary><strong>Q: The script is not found after running setup.</strong></summary>

> **A:** Ensure `~/.local/bin` is in your `$PATH`. You can add it to your shell resource file:
>
> ```bash
> # For bash users:
> echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
> source ~/.bashrc
>
> # For zsh users:
> echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
> source ~/.zshrc
> ```

</details>

<details>
<summary><strong>Q: Does this work on Windows?</strong></summary>

> **A:** Not natively, but it should work in WSL or other Unix-like environments.

</details>

<details>
<summary><strong>Q: How does the script handle authentication?</strong></summary>

> **A:** The script uses your existing git configuration and SSH keys.

</details>

<details>
<summary><strong>Q: What happens if a repository has uncommitted changes?</strong></summary>

> **A:** The script will attempt to pull/fetch as normal. Git's built-in safety features will prevent data loss, but you may see warnings about uncommitted changes.

</details>

## Support and Issues

Please use [GitHub Issues](https://github.com/StrangeRanger/mass-git/issues) for bug reports and feature requests.

## License

This project is licensed under the [MIT License](LICENSE).
