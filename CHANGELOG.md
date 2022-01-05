# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [1.0.4] - 2022-01-04
### Added
- testing doc
- devcontainer for delivery
- chef version in metadata
- tested with chef 15.3, 16, and 17
### Updated
- kitchen dokken
- github action workflow replaces travis-ci
### Fixed
- deprecation as error in kitchen dockken
### Removed
- ubuntu 14.04 from test kitchen

## [1.0.3] - 2020-05-04
### Added
- use group property during system install
- owner property to user install, deprecates user property
- owner property to user install
### Updated
- node-build cookbook to 1.0.2
- git url, using chef example format
- git revision, using HEAD instead of master
- Reorder properties alphabetically
### Fixed
- debian error on group permissions
- set user and group for node_build_plugin_install

## [1.0.2] - 2020-04-01
### Fixed
- group of file/directory is the same as the owner
- kitchen test now working with dokken and vagrant

## [1.0.1] - 2018-05-04
### Fixed
- Property tables at readme
- Update 1.0.0 changelog
- Foodcritic warning renaming name_attribute to name_property

## [1.0.0] - 2018-02-08
### Added
- System install, reusing user install
- Testing readme
### Updated
- Refactoring user install
- Update readme
### Fixed
- Travis/kitchen.dokken
### Removed
- Legacy node install
- Remove versions property on install
- Unused code
- Unnecesary code

## [0.1.5] - 2018-02-02
### Added
- Nodenv Install resource
- Development at readme
### Removed
- Remove testing doc
### Updated
- Add testing to readme
- Install git with cookbook

## [0.1.4] - 2018-01-25
### Updated
- Update nodenv init runs only if nodenv is installed

## [0.1.3] - 2018-01-25
### Added
- Add a test cookbook with inspec tests
- Add root_path helper as we keep trying to find the root path for commands
- Add inspec tests for global version setting
### Fixed
- Fix template to look at the nodenv cookbook rather than the wrapper cookbook (default)
- Fix typo in command resource
### Updated
- Grab the rbenv_script and make a nodenv_command resource so we can get the global version easily.
### Removed
- Remove Vagrantfile we no longer require
- Remove default delivery and add  the community cookbook toml
- Remove git_url we're no longer using
- Remove default attributes.
- Remove the default recipe as we're a library cookbook and we now have a test cookbook
- Remove user_home as it's no longer used

## [0.1.2] - 2017-08-06
### Added
- Add testing guide
- Add contributing guide
- Add code of conduct
### Remove
- Remove centos from automated testing

## [0.1.1] - 2017-08-06
### Added
- Add user install
