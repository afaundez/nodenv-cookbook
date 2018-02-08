provides :nodenv_node # for backwards compatibility

property :version, String, name_property: true
property :user, String, default: 'root'

action :install do
  nodenv_command "Install node #{new_resource.version} for #{new_resource.user}" do
    version   new_resource.version
    user      new_resource.user
    command   "nodenv install #{new_resource.version}"
    not_if    { node_exists? }
  end
end

action_class do
  include Chef::Nodenv::ScriptHelpers

  def node_exists?
    ::File.exist? ::File.join(root_path, 'versions', new_resource.version)
  end
end
