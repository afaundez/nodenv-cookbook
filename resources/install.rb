property :version, String, name_property: true
property :user, String, default: 'root'
property :group, String, default: ''

action :install do
  nd_group = new_resource.group != '' ? new_resource.group : new_resource.user
  nodenv_command "Install node #{new_resource.version} for #{new_resource.user}" do
    version   new_resource.version
    user      new_resource.user
    group     nd_group
    command   "nodenv install #{new_resource.version}"
    not_if    { ::File.exist? node_version_path }
  end
end

action_class do
  include Chef::Nodenv::ScriptHelpers

  def node_version_path
    ::File.join root_path, 'versions', new_resource.version
  end
end
