case node['platform_family']
when 'debian'
  execute 'APT update on debian platforms' do
    command 'apt-get update -qq'
  end
  package 'util-linux'
when 'amazon'
  package 'shadow-utils'
end

user 'user-with-nodenv' do
  home '/home/user-with-nodenv'
  manage_home true
  action :create
end

user 'user-without-nodenv' do
  home '/home/user-without-nodenv'
  manage_home true
  action :create
end
