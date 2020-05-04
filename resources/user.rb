property :git_revision, String, default: 'master'
property :nodenv_root, String, default: lazy { ::File.join ::File.expand_path("~#{user}"), '.nodenv' }
property :git_url, String, default: 'git://github.com/nodenv/nodenv.git'
property :group, String
property :owner, String, name_property: true
deprecated_property_alias :user, :owner,

action :install do
  node.run_state['root_path'] = new_resource.nodenv_root

  git_client 'default'

  git root_path do
    repository new_resource.git_url
    reference  new_resource.git_revision
    user new_resource.user
    group new_resource.user
    user new_resource.owner
    group new_resource.group if new_resource.property_is_set?(:group)
    action :checkout
    not_if { ::File.exist? nodenv_bin_file }
  end

  template '/etc/profile.d/nodenv.sh' do
    source 'nodenv.sh.erb'
    owner 'root'
    mode '0755'
    cookbook 'nodenv'
  end

  node_build_plugin_install ::File.join(nodenv_plugins_path, 'node-build')
end

action_class do
  include Chef::Nodenv::ScriptHelpers
end
