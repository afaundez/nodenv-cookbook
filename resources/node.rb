provides :nodenv_node

property :version, String, name_property: true
property :user, String
property :user_home, String, default: lazy { ::File.expand_path("~#{user}") }

action :install do
  command = %(nodenv install #{new_resource.version})

  bash "#{command} for user #{new_resource.user}" do
    code command
    user new_resource.user
    action :run
    flags '-l'
    environment 'HOME' => new_resource.user_home
    not_if { ::File.exist?(::File.join(new_resource.user_home, '.nodenv', 'versions', new_resource.version, 'bin', 'node')) }
  end
end
