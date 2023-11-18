# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Function's indicators.

### Changed

### Fixed

- Typo in `lua_gethookcount(3)`.
- Description in `lua_close(3)`.

[Unreleased]: https://github.com/ligurio/luac-manual-pages/compare/0.1.2...master

## [0.1.2]

### Added

- Add SEE ALSO sections with a reference to Lua 5.1 Reference Manual and cross
  references to another manual pages.

### Fixed

- Fix a short description in `lua_tointeger.3`.

[0.1.2]: https://github.com/ligurio/luac-manual-pages/compare/0.1.1...0.1.2

## [0.1.1]

### Added

- Add a set of manual pages based on "Lua 5.1 Reference Manual 4.1 – Functions
  and Types".

### Changed

- Set a minimum level to be reported by mandoc to "style".
- Add missing description of `lua_Debug` structure in `lua_Debug.3`.

### Fixed

- Fix style warnings produced by mandoc.

[0.1.1]: https://github.com/ligurio/luac-manual-pages/compare/0.1.0...0.1.1

## [0.1.0] - 2022-07-20

### Added

- Initial set of manual pages based on "Lua 5.1 Reference Manual: 3.7 –
  Functions and Types" and "Lua 5.1 Reference Manual 3.8 – The Debug Interface".
- Add a Make target to generate HTML pages.
- Add a Make target to cleanup environment.

[0.1.0]: https://github.com/ligurio/luac-manual-pages/compare/90ab1ee...0.1.0
