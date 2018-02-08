provides :nodenv_system

property :_, String, name_property: true
property :versions, Array, default: []
property :git_url, String, default: 'https://github.com/nodenv/nodenv.git'
property :git_revision, String, default: 'master'
property :nodenv_root, String, default: '/usr/local/nodenv'
property :nodenv_plugins, String, default: lazy { ::File.join(nodenv_root, 'plugins') }

action :install do
  node.run_state['root_path'] = new_resource.nodenv_root

  nodenv_user 'root' do
    user 'root'
    versions new_resource.versions
    git_url new_resource.git_url
    git_revision new_resource.git_revision
    nodenv_root new_resource.nodenv_root
    nodenv_plugins new_resource.nodenv_plugins
  end
end
