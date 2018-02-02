provides :nodenv

property :user,     String, name_attribute: true
property :versions, Array, default: []

property :git_url,      String, default: 'https://github.com/nodenv/nodenv.git'
property :git_revision, String, default: 'master'

property :nodenv_root,    String, default: lazy { ::File.join(::File.expand_path("~#{user}"), '.nodenv') }
property :nodenv_plugins, String, default: lazy { ::File.join(nodenv_root, 'plugins') }

action :install do
  node.run_state['root_path'] = new_resource.nodenv_root

  include_recipe 'git'

  git new_resource.nodenv_root do
    repository new_resource.git_url
    reference  new_resource.git_revision
    user       new_resource.user
    group      new_resource.user
    action :checkout
    not_if { ::File.exist?(::File.join(new_resource.nodenv_root, 'bin', 'nodejs')) }
  end

  directory new_resource.nodenv_plugins do
    owner new_resource.user
    group new_resource.user
    mode '0755'
  end

  git ::File.join(new_resource.nodenv_plugins, 'node-build') do
    repository 'https://github.com/nodenv/node-build.git'
    reference  'master'
    user       new_resource.user
    group      new_resource.user
    action :checkout
    not_if { ::File.exist?(::File.join(new_resource.nodenv_plugins, 'node-build', 'bin', 'node-build')) }
  end

  template '/etc/profile.d/nodenv.sh' do
    source 'nodenv.sh.erb'
    owner 'root'
    mode '0755'
    cookbook 'nodenv'
  end

  new_resource.versions.each do |version|
    nodenv_install version do
      user new_resource.user
    end
  end
end
