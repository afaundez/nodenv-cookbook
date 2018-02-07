# nodenv Cookbook

Install [nodenv](https://github.com/nodenv/nodenv) and manage node versions. Based in [ruby_rbenv](https://github.com/sous-chefs/ruby_rbenv) and my own [rbenv](https://github.com/afaundez-cookbooks/rbenv).

## Usage

### User Install

```ruby
nodenv 'user' do
  versions ['8.2.1']
  action   :install
end
```

### Commands

#### Install

```ruby
nodenv_install ['8.2.1'] do
  user 'user'
end
```

#### Global

```ruby
nodenv_global '8.2.1' do
  user 'user'
end
```

## Testing

Check [TESTING.md](TESTING.md)

## Development

- [kitchen converge docs](https://kitchen.ci/docs/getting-started/running-converge): `kitchen converve`
