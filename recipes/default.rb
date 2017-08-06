node['nodenv']['user_installs'].each do |user_install|
  nodenv user_install['user'] do
    versions user_install['nodes']
    action :install
  end
end
