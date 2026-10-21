# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.3] - 2026-10-20

### Fixed

- When one side of a hunk has no lines (diffing against an empty string),
  its range now starts at 0, as GNU diff writes it (`-0,0` or `+0,0`).
  It used to start at 1.

### Changed

- The tests run with
  [gilramir/gren-unit-node](https://github.com/gilramir/gren-unit-node)
  and build with Gren 0.6.6.
- Added devbox support for building the package and running the tests.

## [1.0.2] - 2026-06-08

### Fixed

- Multiline strings are now compatible with the Gren-based version of the
  Gren parser.

## [1.0.1] - 2026-05-22

### Fixed

- Build the LCS table row by row with `Array.Builder`, fixing a large
  performance problem.

## [1.0.0] - 2026-05-02

- First release.

[1.0.3]: https://github.com/gilramir/gren-diff/compare/1.0.2...1.0.3
[1.0.2]: https://github.com/gilramir/gren-diff/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/gilramir/gren-diff/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/gilramir/gren-diff/releases/tag/1.0.0
