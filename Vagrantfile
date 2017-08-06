# Vagrantfile generated with https://github.com/afaundez/vagrant-templated

['vagrant-omnibus', 'vagrant-berkshelf'].each do |plugin_name|
  unless Vagrant.has_plugin? plugin_name
    raise "#{plugin_name} plugin is required. Please run `vagrant plugin install #{plugin_name}`"
  end
end

Vagrant.configure('2') do |config|
  config.vm.box = 'bento/ubuntu-16.04'
  config.omnibus.chef_version = 'latest'
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'apt'
    chef.add_recipe 'chefdk'
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
  end
end
