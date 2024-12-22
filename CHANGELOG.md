# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## v2.0.0 - 2024-12-22

> [!WARNING]
> <u>**BREAKING CHANGE**</u>
>
> This release has a breaking change, as the `path` argument no longer requires a flag. It is now a positional argument. This means that the script will no longer work with the `-p` flag. Instead, you will need to provide the path as a standalone argument anywhere in the command.

### Added

- New setup script to handle linking the script into user's local bin directory.

### Changed

- ⚠️ The `path` no longer requires a flag, and is now a positional argument.
- Improved the handling of ANSI colors for output text.
- Updated and removed unnecessary comments.
- Updated and improved bash script formatting and style.
- Consolidated redundant variable declarations and ensured consistent use of `readonly`.
- Enhanced clarity and maintainability of conditional logic for options parsing.
- Improved comments to explain rationale for shellcheck suppressions.
- Refined error handling and exit codes for invalid input and directory checks.
- Standardized style and formatting for better readability.

### Fixed

- Fixed slight problem with `realpath`.

### Removed

- Removed `.deesource.toml` file.

## [v1.2.0] - 2022-08-05

### Added

- Can perform a dry-run using `-d` or `--dry-run`.

### Changed

- Slight refactoring to reduce semi-duplicate code.

## [v1.1.0] - 2022-07-14

### Added

- Can optionially fetch updates from git repositories, instead of pulling them.

### Changed

- Replaced commands with Parameter Expansion where possible.
- Changed how the variables used to change the color of output text, are formatted, in the hopes of increasing portability.
- Refactored if statements to be more simplistic.

## [v1.0.0] - 2021-07-23

- Initial release.

[unreleased]: https://github.com/StrangeRanger/mass-git/compare/v1.2.2...HEAD
[v1.2.2]: https://github.com/StrangeRanger/mass-git/releases/tag/v1.2.2
[v1.2.0]: https://github.com/StrangeRanger/mass-git/releases/tag/v1.2.0
[v1.1.0]: https://github.com/StrangeRanger/mass-git/releases/tag/v1.1.0
[v1.0.0]: https://github.com/StrangeRanger/mass-git/releases/tag/v1.0.0
