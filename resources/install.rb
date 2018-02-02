provides :nodenv_node # for backwards compatibility

property :version, String, name_property: true
property :user, String
property :user_home, String, default: lazy { ::File.expand_path("~#{user}") }

action :install do
  cmd = %(nodenv install #{new_resource.version})

  bash "#{cmd} for user #{new_resource.user}" do
    code cmd
    user new_resource.user
    action :run
    flags '-l'
    environment 'HOME' => new_resource.user_home
    not_if { node_exists? }
  end
end

action_class do
  include Chef::Nodenv::ScriptHelpers

  def node_exists?
    ::File.exist?(::File.join(new_resource.user_home, '.nodenv', 'versions', new_resource.version, 'bin', 'node'))
  end
end
