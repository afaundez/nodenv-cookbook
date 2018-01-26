# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
