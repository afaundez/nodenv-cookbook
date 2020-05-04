property :git_revision, String, default: 'HEAD'
property :git_url, String, default: 'git://github.com/nodenv/nodenv.git'
property :nodenv_root, String, default: '/usr/local/nodenv'

action :install do
  node.run_state['root_path'] = new_resource.nodenv_root

  nodenv_user 'root' do
    nodenv_root new_resource.nodenv_root
    git_url new_resource.git_url
    git_revision new_resource.git_revision
    group 'staff' if platform_family? 'debian'
  end
end
