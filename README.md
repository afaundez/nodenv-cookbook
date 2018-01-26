# nodenv Cookbook

Install [nodenv](https://github.com/nodenv/nodenv) and manage node versions. Based in [ruby_rbenv](https://github.com/sous-chefs/ruby_rbenv) and my own [rbenv](https://github.com/afaundez-cookbooks/rbenv).

## Usage

```ruby
nodenv 'user' do
  versions ['8.2.1']
  action :install
end
```

If you are using vagrant, put this on your Vagrantfile:

```ruby
chef.add_recipe 'nodenv'

chef.json = {
  nodenv: {
    user_installs: [
      {
        user: 'vagrant',
        nodes: ['8.2.1'],
      },
    ],
  },
}
```

## Testing

Basically `kitchen test`. Check [kitchen test docs](https://kitchen.ci/docs/getting-started/running-test)

## Development

Use the vagrant vm that kitchen admin for testing. Check [kitchen converge docs](https://kitchen.ci/docs/getting-started/running-converge)
