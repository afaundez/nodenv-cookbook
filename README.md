[![Chef cookbook](https://img.shields.io/cookbook/v/nodenv.svg)]()
[![Travis](https://img.shields.io/travis/afaundez/nodenv-cookbook.svg)]()
# Nodenv Cookbook

Chef resource for [nodenv](https://github.com/nodenv/nodenv) installs, configuration and management of node versions.

## Usage

You can choose whether a user or a system install (or both). Check [test recipes](/test/fixtures/cookbooks/test/recipes) for working examples.

### Install

#### User

```ruby
nodenv_user 'user'
```

#### System-wide

```ruby
nodenv_system 'system'
```

### Commands

Commands without `user` property will assume system-wide installation.

#### Install

Install a node version for user/system nodenv.

```ruby
nodenv_install '8.2.1' do
  user 'user'
end

nodenv_install '9.5.0'
```

#### Global

Set a global node version for user/system-wide nodenv.

```ruby
nodenv_global '8.2.1' do
  user 'user'
end

nodenv_global '9.5.0'
```


## Testing

Check [TESTING.md](TESTING.md)

## Development

Check [kitchen converge docs](https://kitchen.ci/docs/getting-started/running-converge).

## Acknowledgements

Based in [ruby_rbenv](https://github.com/sous-chefs/ruby_rbenv).
